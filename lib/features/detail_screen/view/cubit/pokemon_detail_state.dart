part of 'pokemon_detail_cubit.dart';

sealed class PokemonDetailState extends Equatable {
  const PokemonDetailState();

  @override
  List<Object> get props => [];
}

final class PokemonDetailInitial extends PokemonDetailState {}

final class PokemonDetailLoading extends PokemonDetailState {}

final class PokemonDetailSuccess extends PokemonDetailState {
  final PokemonDetailEntity pokemon;

  const PokemonDetailSuccess(this.pokemon);

  @override
  // TODO: implement props
  List<Object> get props => [pokemon];
}

final class PokemonDetailFailed extends PokemonDetailState {
  final String error;

  const PokemonDetailFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
