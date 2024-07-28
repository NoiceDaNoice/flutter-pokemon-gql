import 'package:equatable/equatable.dart';

class EvolutionEntity extends Equatable {
  final String? id;

  const EvolutionEntity({
    this.id,
  });

  factory EvolutionEntity.fromJson(Map<String, dynamic> json) =>
      EvolutionEntity(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };

  @override
  List<Object?> get props => [id];
}
