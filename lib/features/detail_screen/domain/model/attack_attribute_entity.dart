import 'package:equatable/equatable.dart';

class AttackAttributeEntity extends Equatable {
  final String? name;
  final String? type;
  final int? damage;

  const AttackAttributeEntity({
    this.name,
    this.type,
    this.damage,
  });

  factory AttackAttributeEntity.fromJson(Map<String, dynamic> json) =>
      AttackAttributeEntity(
        name: json["name"],
        type: json["type"],
        damage: json["damage"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "damage": damage,
      };

  @override
  List<Object?> get props => [name, type, damage];
}
