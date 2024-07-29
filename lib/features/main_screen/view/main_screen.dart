import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_gql/common/theme.dart';
import 'package:flutter_pokemon_gql/features/main_screen/domain/entity/pokemon_entity.dart';
import 'package:flutter_pokemon_gql/features/main_screen/view/cubit/pokemon_cubit.dart';
import 'package:flutter_pokemon_gql/features/main_screen/view/custom_widget/custom_tile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PokemonCubit _pokemonCubit = PokemonCubit();
  final controller = ScrollController();
  List<PokemonEntity> pokemonData = [];
  bool hasReachMax = false;
  @override
  void initState() {
    controller.addListener(() {
      if (controller.position.atEdge) {
        bool isTop = controller.position.pixels == 0;
        if (isTop) {
        } else {
          if (!hasReachMax) _pokemonCubit.getAllPokemon();
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget listPokemon() {
      return BlocProvider(
        create: (context) => _pokemonCubit..getAllPokemon(),
        child: BlocConsumer<PokemonCubit, PokemonState>(
          listener: (context, state) {
            if (state is PokemonFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Failed to load pokemon.'),
                  action: SnackBarAction(
                    label: 'Refresh',
                    onPressed: () {
                      _pokemonCubit.getAllPokemon();
                    },
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is PokemonLoading) {
              if (pokemonData.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
            if (state is PokemonSuccess) {
              pokemonData = state.pokemons;
              hasReachMax = state.max;
            }
            return ListView.builder(
              controller: controller,
              itemCount: pokemonData.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index < pokemonData.length) {
                  return CustomTile(
                    pokemonEntity: pokemonData[index],
                    function: () {
                      Navigator.pushNamed(
                        context,
                        '/detail-page',
                        arguments: pokemonData[index],
                      );
                    },
                  );
                } else {
                  if (pokemonData.isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: defaultPadding),
                      child: Center(
                        child: (hasReachMax == false)
                            ? const CircularProgressIndicator()
                            : const Text('No more pokemon :('),
                      ),
                    );
                  } else {
                    return const Center();
                  }
                }
              },
            );
          },
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: listPokemon(),
      ),
    );
  }
}
