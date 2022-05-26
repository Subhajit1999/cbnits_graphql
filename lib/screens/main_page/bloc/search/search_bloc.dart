import 'package:cbnits_graphql/models/country.dart';
import 'package:cbnits_graphql/screens/main_page/bloc/search/search_event.dart';
import 'package:cbnits_graphql/screens/main_page/bloc/search/search_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCountriesBloc extends Bloc<SearchCountriesEvent, SearchCountriesState> {

  SearchCountriesBloc() : super(InitialState());

  @override
  void onTransition(Transition<SearchCountriesEvent, SearchCountriesState> transition) {
    debugPrint(transition.toString());
    super.onTransition(transition);
  }

  @override
  Stream<SearchCountriesState> mapEventToState(SearchCountriesEvent event) async*{

    if(event is SearchCountry) { // get countries data
      String query = event.query;

      yield SearchLoadingState();
      try{
        List<Country> list = [];
        for(Country country in event.countries) {
          if(event.source=='search') {
            if(country.name.toLowerCase().contains(query) || country.code.toLowerCase().contains(query)) {
              list.add(country);
            }
          }else {
            if(country.continent.name.contains(query)) {
              list.add(country);
            }
          }
        }
        list.sort((a, b){ //sorting in ascending order
          return a.name.compareTo(b.name);
        });
        if(list.isNotEmpty) {
          yield SearchSuccessState(list);
        }else {
          yield SearchFailureState('No country found matching your search.');
        }

      }catch (error) {
        yield SearchFailureState(error.toString());
      }
    }
    else if(event is ResetSearchBloc) {  // Reset bloc
      yield InitialState();
    }
  }
}