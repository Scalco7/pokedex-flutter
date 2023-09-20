import 'package:flutter/material.dart';
import 'package:pokedex_copy/common/models/pokemon.dart';
import 'package:pokedex_copy/features/pokedex/screens/details/widgets/detail_item_list_widget.dart';

class DetailListWidget extends StatelessWidget {
  const DetailListWidget({
    super.key,
    required this.pokemon,
    required this.list,
    required this.controller,
    required this.onChangePokemon,
  });
  final Pokemon pokemon;
  final List<Pokemon> list;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 350,
        color: pokemon.baseColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      pokemon.name,
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "#${pokemon.num}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 260,
              width: double.infinity,
              child: PageView(
                onPageChanged: (index) => onChangePokemon(list[index]),
                controller: controller,
                children: list.map(
                  (e) {
                    bool same = e.name == pokemon.name;
                    return DetailItemListWidget(same: same, pokemon: e);
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
