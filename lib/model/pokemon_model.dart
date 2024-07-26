// To parse this JSON data, do
//
//     final pokemon = pokemonFromJson(jsonString);

import 'dart:convert';

PokemonModel pokemonFromJson(String str) =>
    PokemonModel.fromJson(json.decode(str));

String pokemonToJson(PokemonModel data) => json.encode(data.toJson());

class PokemonModel {
  Data? data;

  PokemonModel({
    this.data,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        data: (json["data"] != null) ? Data.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class Data {
  List<PokemonElement>? pokemons;

  Data({
    this.pokemons,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pokemons: List<PokemonElement>.from(
            json["pokemons"].map((x) => PokemonElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pokemons": List<dynamic>.from(pokemons!.map((x) => x.toJson())),
      };
}

class PokemonElement {
  String? id;
  String? name;
  String? image;

  PokemonElement({
    this.id,
    this.name,
    this.image,
  });

  factory PokemonElement.fromJson(Map<String, dynamic> json) => PokemonElement(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
