import 'package:flutter/material.dart';
import 'package:pokedex_copy/common/models/pokemon.dart';
import 'package:pokedex_copy/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex_copy/features/pokedex/screens/home/pages/widgets/type_widget.dart';

class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget({
    super.key,
    required this.pokemon,
    required this.onTap,
    required this.index,
  });
  final Pokemon pokemon;
  final Function(String, DetailArguments) onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          onTap("/details", DetailArguments(pokemon: pokemon, index: index)),
      child: Container(
        decoration: BoxDecoration(
          color: pokemon.baseColor!.withOpacity(0.8),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      pokemon.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  Text(
                    '#${pokemon.num}',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        pokemon.type.map((e) => TypeWidget(name: e)).toList(),
                  ),
                  Flexible(
                    child: Image.network(pokemon.image),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
