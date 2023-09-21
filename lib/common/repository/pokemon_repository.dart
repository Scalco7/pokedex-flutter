import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex_copy/common/consts/api_consts.dart';
import 'package:pokedex_copy/common/error/failure.dart';
import 'package:pokedex_copy/common/models/pokemon.dart';

abstract class IPokemonRepository {
  Future<List<Pokemon>> getAllPokemons();
}

class PokemonRepository implements IPokemonRepository {
  String m = "fodeu";
  PokemonRepository();

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      m = "deu ruim";
      final response = await http.get(Uri.parse(ApiConsts.allPokemonsURL));
      m = "ta aqui";
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      m = "chegouuu";
      final list = json['pokemon'] as List<dynamic>;
      m = "mais avançoooo";
      return list.map((e) => Pokemon.fromMap(e)).toList();
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }
}
