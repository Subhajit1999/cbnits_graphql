import 'package:cbnits_graphql/models/country.dart';

abstract class SearchCountriesState {
  SearchCountriesState([List props = const []]);
}

class InitialState extends SearchCountriesState {

  @override
  String toString() => 'InitialState';

  @override
  List<Object> get props => [];
}

class SearchLoadingState extends SearchCountriesState {

  @override
  String toString() => 'SearchLoadingState';

  @override
  List<Object> get props => [];
}

class SearchSuccessState extends SearchCountriesState {
  final List<Country> countries;
  SearchSuccessState(this.countries);

  @override
  String toString() => 'SearchSuccessState';

  @override
  List<Object> get props => [countries];
}

class SearchFailureState extends SearchCountriesState {
  final dynamic error;
  SearchFailureState(this.error);

  @override
  String toString() => 'DataFailureState';

  @override
  List<Object> get props => [];
}