import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pokemon_gql/features/detail_screen/data/network/graphql/api.dart';
import 'package:flutter_pokemon_gql/features/detail_screen/domain/model/pokemon_detail_entity.dart';

part 'pokemon_detail_state.dart';

class PokemonDetailCubit extends Cubit<PokemonDetailState> {
  PokemonDetailCubit() : super(PokemonDetailInitial());

  void getPokemon({required String id,required String name}) async {
    try {
      emit(PokemonDetailLoading());
      var response = await Api().getPokemon(id: id, name: name);
      emit(PokemonDetailSuccess(response));
    } catch (e) {
      emit(PokemonDetailFailed(e.toString()));
    }
  }
}
