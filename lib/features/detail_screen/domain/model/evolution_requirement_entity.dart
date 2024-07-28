import 'package:equatable/equatable.dart';

class EvolutionRequirementEntity extends Equatable {
  final int? amount;
  final String? name;

  const EvolutionRequirementEntity({
    this.amount,
    this.name,
  });

  factory EvolutionRequirementEntity.fromJson(Map<String, dynamic> json) =>
      EvolutionRequirementEntity(
        amount: json["amount"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "name": name,
      };

  @override
  List<Object?> get props => [amount, name];
}
