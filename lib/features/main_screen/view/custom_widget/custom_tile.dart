import 'package:flutter/material.dart';
import 'package:flutter_pokemon_gql/features/main_screen/domain/entity/pokemon_entity.dart';

import '../../../../common/theme.dart';

class CustomTile extends StatelessWidget {
  final PokemonEntity pokemonEntity;
  final Function() function;
  const CustomTile(
      {super.key, required this.pokemonEntity, required this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Material(
        child: Ink(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                defaultRounded,
              ),
            ),
          ),
          child: InkWell(
            onTap: function,
            splashColor: Colors.transparent,
            child: SizedBox(
              height: 100,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                        pokemonEntity.image!,
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  const SizedBox(
                    width: defaultSizedBox,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pokemonEntity.name!,
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              height: defaultSizedBox,
                            ),
                            Text('#${pokemonEntity.number!}'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
