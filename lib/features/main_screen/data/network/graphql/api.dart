import 'package:flutter_pokemon_gql/common/string.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../domain/entity/pokemon_entity.dart';

class Api {
  GraphQLClient client = GraphQLClient(
    link: HttpLink(url),
    cache: GraphQLCache(),
  );

  Future<List<PokemonEntity>> getPokemons({required int first}) async {
    try {
      QueryResult queryResult = await client.query(
        QueryOptions(
          document: gql(
            """query {
  pokemons(first:$first) {
    id
    image
    name
    number
  }
}""",
          ),
        ),
      );
      List? response = queryResult.data?['pokemons'];
      List<PokemonEntity> data = response!
          .map((pokemons) => PokemonEntity.fromJson(pokemons))
          .toList();
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
