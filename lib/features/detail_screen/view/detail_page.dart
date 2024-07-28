import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_gql/features/detail_screen/data/network/graphql/api.dart';
import 'package:flutter_pokemon_gql/features/detail_screen/view/cubit/pokemon_detail_cubit.dart';
import 'package:flutter_pokemon_gql/features/main_screen/domain/entity/pokemon_entity.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemonEntity =
        ModalRoute.of(context)?.settings.arguments as PokemonEntity;
    return BlocProvider(
      create: (context) => PokemonDetailCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: TextButton(
              onPressed: () {
                print(pokemonEntity);
                Api().getPokemon(
                    id: pokemonEntity.id!, name: pokemonEntity.name!);
              },
              child: Text('test')),
        ),
      ),
    );
  }
}
