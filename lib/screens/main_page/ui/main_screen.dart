import 'package:cbnits_graphql/configs/size_config.dart';
import 'package:cbnits_graphql/models/country.dart';
import 'package:cbnits_graphql/screens/error/ui/error_page.dart';
import 'package:cbnits_graphql/screens/main_page/bloc/data/countries_bloc.dart';
import 'package:cbnits_graphql/screens/main_page/bloc/data/countries_event.dart';
import 'package:cbnits_graphql/screens/main_page/bloc/data/countries_state.dart';
import 'package:cbnits_graphql/screens/main_page/bloc/search/search_bloc.dart';
import 'package:cbnits_graphql/screens/main_page/bloc/search/search_event.dart';
import 'package:cbnits_graphql/screens/main_page/bloc/search/search_state.dart';
import 'package:cbnits_graphql/screens/main_page/widgets/country_card.dart';
import 'package:cbnits_graphql/services/network_manager.dart';
import 'package:cbnits_graphql/shared_widgets/appbar.dart';
import 'package:cbnits_graphql/shared_widgets/loading_widget.dart';
import 'package:cbnits_graphql/shared_widgets/search_bar.dart';
import 'package:cbnits_graphql/shared_widgets/snackbars.dart';
import 'package:cbnits_graphql/utils/statics.dart';
import 'package:cbnits_graphql/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late GetCountriesBloc _countriesBloc;
  late SearchCountriesBloc _searchBloc;
  List<Country> countries = [], searchData = [];
  bool networkConnected = false;

  @override
  void initState() {
    super.initState();
    _countriesBloc = BlocProvider.of<GetCountriesBloc>(context);
    _searchBloc = BlocProvider.of<SearchCountriesBloc>(context);
    _fetchCountriesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(Strings.appName),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),

        child: Container(
          padding: EdgeInsets.all(2.5 * SizeConfig.heightMultiplier),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar('Search by country name or code', _onClickSearch, _onClearSearch),

              SizedBox(height: 3 * SizeConfig.heightMultiplier,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Countries', style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontSize: 3 * SizeConfig.textMultiplier
                  ),),
                  _filterMenu()
                ],
              ),
              SizedBox(height: SizeConfig.heightMultiplier,),

              _blocWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget _filterMenu() {
    return PopupMenuButton(
      onSelected: (String item) => item=='All'? _onClearSearch() : _searchBloc.add(SearchCountry(item, countries, 'filter')),
      icon: Icon(Icons.filter_list_rounded, size: 3.5 * SizeConfig.heightMultiplier,),
      padding: EdgeInsets.zero,
      itemBuilder: (context) {
        return AppStatics.continents.map((String choice) {
          return  PopupMenuItem<String>(
            value: choice,
            child: Text(choice, style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 1.85 * SizeConfig.textMultiplier
            ),),
          );
        }
        ).toList();
      }
    );
  }

  Widget _blocWidget() {
    return BlocConsumer<GetCountriesBloc, GetCountriesState>(
      bloc: _countriesBloc,
      listener: (context, state) {
        if(state is DataSuccessState) {
          countries = List.from(state.countries);
          searchData = List.from(state.countries);
        }
      },
      builder: (context, state) {
        if(state is DataLoadingState) {
          return const LoadingWidget();

        }else if(state is DataSuccessState) {
          return BlocConsumer<SearchCountriesBloc, SearchCountriesState>(
            bloc: _searchBloc,
            listener: (context, state) {
              if(state is SearchSuccessState) {
                searchData = List.from(state.countries);
              }
            },
            builder: (context, state) {
              if(state is SearchLoadingState) {
                return const LoadingWidget();

              } else if(state is SearchSuccessState) {
                return _countriesList();

              }else if(state is SearchFailureState) {
                return ErrorPage('Error!', state.error, false, () {});
              }
              return searchData.isNotEmpty? _countriesList() : const SizedBox();
            },
          );

        }else if(state is DataFailureState) {
          return ErrorPage('Error!', state.error, false, () {});
        }
        return networkConnected? Container() : ErrorPage('Network Error!', NetworkManager.networkErrorMsg,
            true, ()=>_fetchCountriesData(retry: true));
      },
    );
  }

  Widget _countriesList() {

    return ListView(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: searchData.map((country) => CountryCard(country)).toList(),
    );
  }

  void _onClickSearch(String value) {
    String query = value.toLowerCase().trim();
    _searchBloc.add(SearchCountry(query, countries, 'search'));
  }

  void _onClearSearch() {
    searchData = List.from(countries);
    _searchBloc.add(ResetSearchBloc());
  }

  void _fetchCountriesData({bool retry = false}) {
    String query = r'''
      query GetCountriesData {
        countries {
          code
          name
          continent {
            name
          }
          currency
          emoji
          languages {
            name
          }
          phone
        }
      }
      ''';
    NetworkManager.isNetworkConnected().then((value) {
      if(value) {
        setState(() {
          networkConnected = value;
        });
        _countriesBloc.add(FetchCountriesData(query, variables: {}));
      }else {
        if(retry) {
          SnackBars.showFloatingSnackBar(context, 'Network Error!', NetworkManager.networkErrorMsg, SnackBars.error!, Icons.error);
        }
      }
    });
  }
}