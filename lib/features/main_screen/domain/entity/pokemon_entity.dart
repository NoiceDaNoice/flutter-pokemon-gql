// To parse this JSON data, do
//
//     final pokemonModel = pokemonModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

PokemonEntity pokemonModelFromJson(String str) =>
    PokemonEntity.fromJson(json.decode(str));

String pokemonModelToJson(PokemonEntity data) => json.encode(data.toJson());

class PokemonEntity extends Equatable {
  final String? id;
  final String? image;
  final String? name;
  final String? number;

  const PokemonEntity({
    this.id,
    this.image,
    this.name,
    this.number,
  });

  factory PokemonEntity.fromJson(Map<String, dynamic> json) => PokemonEntity(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "number": number,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [id,image,name,number];
}
