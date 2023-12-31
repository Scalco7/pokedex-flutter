import 'package:flutter/material.dart';
import 'package:pokedex_copy/common/repository/pokemon_repository.dart';
import 'package:pokedex_copy/features/pokedex/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex 2k23',
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      home: PokedexRoute(
        repository: PokemonRepository(),
      ),
    );
  }
}
