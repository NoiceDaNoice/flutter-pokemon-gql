import 'dart:convert';
import 'package:equatable/equatable.dart';

import 'attack_entity.dart';
import 'evolution_entity.dart';
import 'evolution_requirement_entity.dart';
import 'weight_attribute_entity.dart';

PokemonDetailEntity pokemonModelFromJson(String str) =>
    PokemonDetailEntity.fromJson(json.decode(str));

String pokemonModelToJson(PokemonDetailEntity data) =>
    json.encode(data.toJson());

class PokemonDetailEntity extends Equatable {
  final String? id;
  final String? number;
  final WeightAttributeEntity? weight;
  final WeightAttributeEntity? height;
  final String? classification;
  final List<String>? types;
  final List<String>? resistant;
  final AttackEntity? attacks;
  final List<String>? weaknesses;
  final double? fleeRate;
  final int? maxCp;
  final List<EvolutionEntity>? evolutions;
  final EvolutionRequirementEntity? evolutionRequirements;
  final int? maxHp;
  final String? image;

  const PokemonDetailEntity({
    this.id,
    this.number,
    this.weight,
    this.height,
    this.classification,
    this.types,
    this.resistant,
    this.attacks,
    this.weaknesses,
    this.fleeRate,
    this.maxCp,
    this.evolutions,
    this.evolutionRequirements,
    this.maxHp,
    this.image,
  });

  factory PokemonDetailEntity.fromJson(Map<String, dynamic> json) =>
      PokemonDetailEntity(
        id: json["id"],
        number: json["number"],
        weight: WeightAttributeEntity.fromJson(json["weight"]),
        height: WeightAttributeEntity.fromJson(json["height"]),
        classification: json["classification"],
        types: List<String>.from(json["types"].map((x) => x)),
        resistant: List<String>.from(json["resistant"].map((x) => x)),
        attacks: AttackEntity.fromJson(json["attacks"]),
        weaknesses: List<String>.from(json["weaknesses"].map((x) => x)),
        fleeRate: json["fleeRate"].toDouble(),
        maxCp: json["maxCP"],
        evolutions: json["evolutions"] == null
            ? null
            : List<EvolutionEntity>.from(
                json["evolutions"].map((x) => EvolutionEntity.fromJson(x))),
        evolutionRequirements: json["evolutionRequirements"] == null
            ? null
            : EvolutionRequirementEntity.fromJson(
                json["evolutionRequirements"]),
        maxHp: json["maxHP"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number": number,
        "weight": weight?.toJson(),
        "height": height?.toJson(),
        "classification": classification,
        "types":
            types != null ? List<dynamic>.from(types!.map((x) => x)) : null,
        "resistant": resistant != null
            ? List<dynamic>.from(resistant!.map((x) => x))
            : null,
        "attacks": attacks?.toJson(),
        "weaknesses": weaknesses != null
            ? List<dynamic>.from(weaknesses!.map((x) => x))
            : null,
        "fleeRate": fleeRate,
        "maxCP": maxCp,
        "evolutions": evolutions != null
            ? List<dynamic>.from(evolutions!.map((x) => x.toJson()))
            : null,
        "evolutionRequirements": evolutionRequirements?.toJson(),
        "maxHP": maxHp,
        "image": image,
      };

  @override
  List<Object?> get props => [
        id,
        number,
        weight,
        height,
        classification,
        types,
        resistant,
        attacks,
        weaknesses,
        fleeRate,
        maxCp,
        evolutions,
        evolutionRequirements,
        maxHp,
        image,
      ];
}
