import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pokemon_gql/features/detail_screen/domain/model/pokemon_detail_entity.dart';

part 'pokemon_detail_state.dart';

class PokemonDetailCubit extends Cubit<PokemonDetailState> {
  PokemonDetailCubit() : super(PokemonDetailInitial());

  void getPokemon()async{
    
  }
}
