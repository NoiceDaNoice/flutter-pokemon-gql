import 'package:equatable/equatable.dart';

class WeightAttributeEntity extends Equatable {
  final String? minimum;
  final String? maximum;

  const WeightAttributeEntity({
    this.minimum,
    this.maximum,
  });

  factory WeightAttributeEntity.fromJson(Map<String, dynamic> json) =>
      WeightAttributeEntity(
        minimum: json["minimum"],
        maximum: json["maximum"],
      );

  Map<String, dynamic> toJson() => {
        "minimum": minimum,
        "maximum": maximum,
      };

  @override
  List<Object?> get props => [minimum, maximum];
}
