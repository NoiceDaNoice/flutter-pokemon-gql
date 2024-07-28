import 'package:equatable/equatable.dart';

import 'attack_attribute_entity.dart';

class AttackEntity extends Equatable {
  final List<AttackAttributeEntity>? fast;
  final List<AttackAttributeEntity>? special;

  const AttackEntity({
    this.fast,
    this.special,
  });

  factory AttackEntity.fromJson(Map<String, dynamic> json) => AttackEntity(
        fast: List<AttackAttributeEntity>.from(
            json["fast"].map((x) => AttackAttributeEntity.fromJson(x))),
        special: List<AttackAttributeEntity>.from(
            json["special"].map((x) => AttackAttributeEntity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "fast": fast != null
            ? List<dynamic>.from(fast!.map((x) => x.toJson()))
            : null,
        "special": special != null
            ? List<dynamic>.from(special!.map((x) => x.toJson()))
            : null,
      };

  @override
  List<Object?> get props => [fast, special];
}
