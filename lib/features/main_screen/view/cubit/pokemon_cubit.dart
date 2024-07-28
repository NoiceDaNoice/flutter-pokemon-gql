import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pokemon_gql/features/main_screen/domain/entity/pokemon_entity.dart';

import '../../data/network/graphql/api.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit() : super(PokemonInitial());

  List<PokemonEntity>? list = [];
  bool max = false;
  void getAllPokemon({int first = 10}) async {
    try {
      emit(PokemonLoading());
      var response = (list!.length < 10)
          ? await Api().getPokemons(first: first)
          : await Api().getPokemons(first: list!.length + first);
      list!.clear();
      list!.addAll(response);
      if (list!.length % 10 != 0) max = true;
      emit(PokemonSuccess(list!,max));
    } catch (e) {
      emit(PokemonFailed(e.toString()));
    }
  }
}
