import 'package:flutter_pokemon_gql/graphql/query/query.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../model/pokemon_model.dart';

class Api {
  GraphQLClient client = GraphQLClient(
    link: HttpLink('https://graphql-pokemon2.vercel.app/'),
    cache: GraphQLCache(),
  );

  Future<void> getPokemons() async {
    try {
      QueryResult queryResult = await client.query(
        QueryOptions(
          cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
          document: gql(
            getPokemonsQuery(first: '10'),
          ),
        ),
      );
      print(queryResult.data);
      PokemonModel data = PokemonModel.fromJson(queryResult.data!);

      print(data.data);
     
    } catch (e) {
      print(e.toString());
    }
  }
}
