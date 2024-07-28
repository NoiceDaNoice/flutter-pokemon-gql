part of 'pokemon_cubit.dart';

sealed class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object> get props => [];
}

final class PokemonInitial extends PokemonState {}

final class PokemonLoading extends PokemonState {}

final class PokemonSuccess extends PokemonState {
  final List<PokemonEntity> pokemons;
  final bool max;
  const PokemonSuccess(this.pokemons,this.max);

  @override
  // TODO: implement props
  List<Object> get props => [pokemons];
}

final class PokemonFailed extends PokemonState {
  final String error;

  const PokemonFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
