import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_gql/common/theme.dart';
import 'package:flutter_pokemon_gql/features/detail_screen/view/cubit/pokemon_detail_cubit.dart';
import 'package:flutter_pokemon_gql/features/detail_screen/view/custom_widget/custom_detail_widget.dart';
import 'package:flutter_pokemon_gql/features/main_screen/domain/entity/pokemon_entity.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    PokemonDetailCubit _pokemonCubit = PokemonDetailCubit();
    final pokemonEntity =
        ModalRoute.of(context)?.settings.arguments as PokemonEntity;

    Widget detailContainer() {
      return BlocProvider(
        create: (context) => _pokemonCubit
          ..getPokemon(
            id: pokemonEntity.id!,
            name: pokemonEntity.name!,
          ),
        child: BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
          builder: (context, state) {
            if (state is PokemonDetailSuccess) {
              return ListView(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(defaultRounded),
                    child: Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Image.network(
                        state.pokemon.image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: CustomDetailWidget(
                      pokemonDetailEntity: state.pokemon,
                    ),
                  ),
                ],
              );
            } else if (state is PokemonDetailFailed) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Failed to load pokemon.'),
                    TextButton(
                      onPressed: () => _pokemonCubit.getPokemon(
                        id: pokemonEntity.id!,
                        name: pokemonEntity.name!,
                      ),
                      child: const Text(
                        'Retry',
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      body: detailContainer(),
    );
  }
}
