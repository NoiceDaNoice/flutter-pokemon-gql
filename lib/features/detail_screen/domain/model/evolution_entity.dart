import 'package:equatable/equatable.dart';

class EvolutionEntity extends Equatable {
  final String? id;
  final String? image;
  final String? name;

  const EvolutionEntity({
    this.id,
    this.image,
    this.name
  });

  factory EvolutionEntity.fromJson(Map<String, dynamic> json) =>
      EvolutionEntity(
        id: json["id"],
        image: json["image"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
      };

  @override
  List<Object?> get props => [id,image,name];
}
