import 'package:flutter/material.dart';
import 'package:pokedex_copy/common/models/pokemon.dart';
import 'package:pokedex_copy/features/pokedex/screens/details/container/detail_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.list, required this.onItemTap});
  final List<Pokemon> list;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(list[index].name),
            onTap: () =>
                onItemTap("/details", DetailArguments(name: list[index].name)),
          );
        },
      ),
    );
  }
}
