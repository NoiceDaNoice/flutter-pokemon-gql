import 'package:flutter/material.dart';
import 'package:flutter_pokemon_gql/common/widget/default_border_container.dart';
import 'package:flutter_pokemon_gql/features/detail_screen/domain/model/pokemon_detail_entity.dart';

import '../../../../common/theme.dart';

class CustomDetailWidget extends StatelessWidget {
  final PokemonDetailEntity pokemonDetailEntity;
  const CustomDetailWidget({super.key, required this.pokemonDetailEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          pokemonDetailEntity.name!,
          style: const TextStyle(
            fontSize: fontLarge,
          ),
        ),
        const SizedBox(
          height: defaultSizedBox,
        ),
        CustomDefaultBorderContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('No :'),
              Text('#${pokemonDetailEntity.number!}'),
            ],
          ),
        ),
        const SizedBox(
          height: defaultSizedBox,
        ),
        CustomDefaultBorderContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Weight :'),
              Text('Min: ${pokemonDetailEntity.weight!.minimum!}'),
              Text('Max: ${pokemonDetailEntity.weight!.maximum!}'),
            ],
          ),
        ),
        const SizedBox(
          height: defaultSizedBox,
        ),
        CustomDefaultBorderContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Height :'),
              Text('Min: ${pokemonDetailEntity.height!.minimum!}'),
              Text('Max: ${pokemonDetailEntity.height!.maximum!}'),
            ],
          ),
        ),
        const SizedBox(
          height: defaultSizedBox,
        ),
        CustomDefaultBorderContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Classification :'),
              Text(pokemonDetailEntity.classification!),
            ],
          ),
        ),
        const SizedBox(
          height: defaultSizedBox,
        ),
        CustomDefaultBorderContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Types :'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (var list in pokemonDetailEntity.types!)
                    Text(
                      list,
                      overflow: TextOverflow.clip,
                    ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: defaultSizedBox,
        ),
        CustomDefaultBorderContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Resistant :'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (var list in pokemonDetailEntity.resistant!)
                    Text(
                      list,
                      overflow: TextOverflow.clip,
                    ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: defaultSizedBox,
        ),
        CustomDefaultBorderContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Attack (Fast) :'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (var list in pokemonDetailEntity.attacks!.fast!)
                    Text(
                      '''
                        Name: ${list.name!}
                        Type: ${list.type!}
                        Damage: ${list.damage!}
                        ''',
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.right,
                    ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: defaultSizedBox,
        ),
        CustomDefaultBorderContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Attack (Special) :'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (var list in pokemonDetailEntity.attacks!.special!)
                    Text(
                      '''
                        Name: ${list.name!}
                        Type: ${list.type!}
                        Damage: ${list.damage!}
                        ''',
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.right,
                    ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: defaultSizedBox,
        ),
        CustomDefaultBorderContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Weeknesses :'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (var list in pokemonDetailEntity.weaknesses!)
                    Text(
                      list,
                      overflow: TextOverflow.clip,
                    ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: defaultSizedBox,
        ),
        CustomDefaultBorderContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Flee Rate :'),
              Text(pokemonDetailEntity.fleeRate!.toString()),
            ],
          ),
        ),
        const SizedBox(
          height: defaultSizedBox,
        ),
        CustomDefaultBorderContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Max CP :'),
              Text(pokemonDetailEntity.maxCp!.toString()),
            ],
          ),
        ),
        const SizedBox(
          height: defaultSizedBox,
        ),
        CustomDefaultBorderContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Max HP :'),
              Text(pokemonDetailEntity.maxHp!.toString()),
            ],
          ),
        ),
        const SizedBox(
          height: defaultSizedBox,
        ),
        CustomDefaultBorderContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Evolutions :'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (pokemonDetailEntity.evolutions!.isNotEmpty) ...[
                    for (var list in pokemonDetailEntity.evolutions!)
                      Row(
                        children: [
                          CircleAvatar(
                            radius: defaultRadius,
                            backgroundImage: NetworkImage(list.image!),
                            backgroundColor: Colors.transparent,
                          ),
                          const SizedBox(
                            width: defaultSizedBox,
                          ),
                          Text(list.name!)
                        ],
                      )
                  ] else ...[
                    const Text('None'),
                  ]
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: defaultSizedBox,
        ),
        CustomDefaultBorderContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                const Text('Evolution Requirements :'),
              if (pokemonDetailEntity.evolutionRequirements!.amount==0) ...[
                const Text('None'),
              ] else ...[
                Text(
                    '${pokemonDetailEntity.evolutionRequirements!.name!} ${pokemonDetailEntity.evolutionRequirements!.amount!} '),
              ]
            ],
          ),
        ),
      ],
    );
  }
}
