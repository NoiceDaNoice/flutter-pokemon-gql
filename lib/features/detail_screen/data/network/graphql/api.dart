import 'package:flutter_pokemon_gql/common/string.dart';
import 'package:flutter_pokemon_gql/features/detail_screen/domain/model/pokemon_detail_entity.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Api {
  GraphQLClient client = GraphQLClient(
    link: HttpLink(url),
    cache: GraphQLCache(),
  );

  Future<PokemonDetailEntity> getPokemon(
      {required String id, required String name}) async {
    try {
      QueryResult queryResult = await client.query(
        QueryOptions(
          document: gql(
            """

query {
  pokemon(id:"UG9rZW1vbjowMDE",name:"Bulbasaur") {
    id
    number
    weight {
      minimum
      maximum
    }
    height {
      minimum
      maximum
    }
    classification
    types
    resistant
    attacks{
      fast{
        name
        type
        damage
      }
      special{
      
        name
        type
        damage
      }
    }
    weaknesses
    fleeRate
    maxCP
    evolutions {
      id
    }
    evolutionRequirements {
      amount
      name
    }
    maxHP
    image
  }
}
""",
          ),
        ),
      );

      var response = PokemonDetailEntity.fromJson(queryResult.data!['pokemon']);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
