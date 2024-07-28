import 'package:flutter/material.dart';
import 'package:flutter_pokemon_gql/features/main_screen/domain/entity/pokemon_entity.dart';

import '../../../../common/theme.dart';

class CustomTile extends StatelessWidget {
  final PokemonEntity pokemonEntity;
  final Function() function;
  const CustomTile({
    super.key,
    required this.pokemonEntity,
    required this.function
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Material(
        child: Ink(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 93, 152, 240),
            borderRadius: BorderRadius.all(
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(defaultRounded),
                    child: Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Image.network(
                        pokemonEntity.image!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: defaultSizedBox,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pokemonEntity.name!,
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(pokemonEntity.number!),
                      ],
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
