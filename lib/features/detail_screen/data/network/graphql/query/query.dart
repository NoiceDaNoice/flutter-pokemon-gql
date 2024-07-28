
String getPokemonQuery({required String id, required String name}) {
  return """
query {
  pokemon(id:$id,name:$name) {
    id
    number
    weight {
      minimum
      maximum
    }
    height {
      minimum
      maximum
    }
    classification
    types
    resistant
    attacks{
      fast{
        name
        type
        damage
      }
      special{
      
        name
        type
        damage
      }
    }
    weaknesses
    fleeRate
    maxCP
    evolutions {
      id
    }
    evolutionRequirements {
      amount
      name
    }
    maxHP
    image
  }
}
""";
}
