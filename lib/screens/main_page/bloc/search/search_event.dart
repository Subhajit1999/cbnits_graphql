import 'package:cbnits_graphql/models/country.dart';

abstract class SearchCountriesEvent {
  SearchCountriesEvent([List props = const []]);
}

class SearchCountry extends SearchCountriesEvent {
  final String query, source;
  final List<Country> countries;

  SearchCountry(this.query, this.countries, this.source);

  @override
  List<Object> get props => [query];

  @override
  String toString() => 'SearchCountry';
}

class ResetSearchBloc extends SearchCountriesEvent {

  @override
  List<Object> get props => [];

  @override
  String toString() => 'ResetSearchBloc';
}