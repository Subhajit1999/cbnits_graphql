import 'package:graphql/client.dart';

class GraphQLProvider {
  late GraphQLClient _client;

  GraphQLProvider() {
    HttpLink link = HttpLink('https://countries.trevorblades.com/graphql');

    _client = GraphQLClient(link: link, cache: GraphQLCache());
  }

  Future<QueryResult> performQuery(String query,
      {Map<String, dynamic>? variables}) async {
    QueryOptions options = QueryOptions(document: gql(query), variables: variables!);

    final result = await _client.query(options);

    return result;
  }

  Future<QueryResult> performMutation(String query,
      {Map<String, dynamic>? variables}) async {
    MutationOptions options =
    MutationOptions(document: gql(query), variables: variables!);

    final result = await _client.mutate(options);

    return result;
  }
}