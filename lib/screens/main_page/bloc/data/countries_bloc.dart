import 'package:cbnits_graphql/data/graphql_provider.dart';
import 'package:cbnits_graphql/models/country.dart';
import 'package:cbnits_graphql/screens/main_page/bloc/data/countries_event.dart';
import 'package:cbnits_graphql/screens/main_page/bloc/data/countries_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCountriesBloc extends Bloc<GetCountriesEvent, GetCountriesState> {
  final GraphQLProvider dataProvider;

  GetCountriesBloc({required this.dataProvider}) : super(InitialState());

  @override
  void onTransition(Transition<GetCountriesEvent, GetCountriesState> transition) {
    debugPrint(transition.toString());
    super.onTransition(transition);
  }

  @override
  Stream<GetCountriesState> mapEventToState(GetCountriesEvent event) async*{
    var result;

    if(event is FetchCountriesData) { // get countries data
      final query = event.query;
      final variables = event.variables;

      yield DataLoadingState();
      try{
        result = await dataProvider.performMutation(query, variables: variables);
        dynamic json = Map<String, dynamic>.from(result.data!);
        List<Country> countries = List<Country>.from(json['countries'].map((x) => Country.fromJson(x)));
        countries.sort((a, b){ //sorting in ascending order
          return a.name.compareTo(b.name);
        });

        if(!result.hasException) {
          yield DataSuccessState(countries);
        }else{
          yield DataFailureState(result.exception?.graphqlErrors[0]);
        }

      }catch (error) {
        yield DataFailureState(error.toString());
      }
    }
  }
}