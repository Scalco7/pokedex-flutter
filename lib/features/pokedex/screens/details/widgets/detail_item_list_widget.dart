import 'package:flutter/material.dart';
import 'package:pokedex_copy/common/models/pokemon.dart';

class DetailItemListWidget extends StatelessWidget {
  const DetailItemListWidget(
      {super.key, required this.same, required this.pokemon});
  final bool same;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 400),
        opacity: !same ? 0.4 : 1,
        child: TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          tween: Tween<double>(
            begin: !same ? 200 : 100,
            end: !same ? 100 : 200,
          ),
          builder: (context, value, child) {
            return Image.network(
              pokemon.image,
              height: value,
              fit: BoxFit.contain,
              color: !same ? Colors.black : null,
            );
          },
        ),
      ),
    );
  }
}
