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
        print('berhasil');
        print(pokemonData.length);
        bool isTop = controller.position.pixels == 0;
        if (isTop) {
        } else {
          if (hasReachMax == false) _pokemonCubit.getAllPokemon();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget listPokemon() {
      return BlocProvider(
        create: (context) => _pokemonCubit..getAllPokemon(),
        child: BlocBuilder<PokemonCubit, PokemonState>(
          builder: (context, state) {
            if (state is PokemonFailed) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Failed to load species.'),
                    TextButton(
                      onPressed: () => _pokemonCubit.getAllPokemon(),
                      child: const Text(
                        'Retry',
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is PokemonSuccess) {
              pokemonData = state.pokemons;
              print(state.max);
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
                  return Padding(
                    padding: const EdgeInsets.only(bottom: defaultPadding),
                    child: Center(
                      child: (hasReachMax == false)
                          ? const CircularProgressIndicator()
                          : const Text('No more pokemon :('),
                    ),
                  );
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
