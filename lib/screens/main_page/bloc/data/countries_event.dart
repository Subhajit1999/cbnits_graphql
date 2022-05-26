abstract class GetCountriesEvent {
  GetCountriesEvent([List props = const []]);
}

class FetchCountriesData extends GetCountriesEvent {
  final String query;
  final Map<String, dynamic> variables;

  FetchCountriesData(this.query, {required this.variables});

  @override
  List<Object> get props => [query, variables];

  @override
  String toString() => 'FetchCountriesData';
}