String getPokemonsQuery({required String first}) {
  return """ 
        query{
  pokemons(first:$first){id,name,image,}
}
        """;
}

String getPokemonQuery({required String id, required String name}) {
  return """
pokemon(id:$id,name:$name){id,name,image,}
""";
}
