import 'package:cbnits_graphql/models/country.dart';

abstract class GetCountriesState {
  GetCountriesState([List props = const []]);
}

class InitialState extends GetCountriesState {

  @override
  String toString() => 'InitialState';

  @override
  List<Object> get props => [];
}

class DataLoadingState extends GetCountriesState {

  @override
  String toString() => 'DataLoadingState';

  @override
  List<Object> get props => [];
}

class DataSuccessState extends GetCountriesState {
  final List<Country> countries;
  DataSuccessState(this.countries);

  @override
  String toString() => 'DataSuccessState';

  @override
  List<Object> get props => [countries];
}

class DataFailureState extends GetCountriesState {
  final dynamic error;
  DataFailureState(this.error);

  @override
  String toString() => 'DataFailureState';

  @override
  List<Object> get props => [];
}