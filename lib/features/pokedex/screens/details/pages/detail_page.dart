import 'package:flutter/material.dart';
import 'package:pokedex_copy/common/models/pokemon.dart';
import 'package:pokedex_copy/features/pokedex/screens/details/widgets/detail_list_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.pokemon,
    required this.list,
    required this.onBack,
    required this.controller,
    required this.onChangePokemon,
  });
  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final ScrollController scrollController = ScrollController();
  bool isOnTop = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedOpacity(
          opacity: isOnTop ? 0 : 1,
          duration: const Duration(milliseconds: 200),
          child: Text(
            widget.pokemon.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: widget.pokemon.baseColor,
        leading: IconButton(
          onPressed: widget.onBack,
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      body: NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollEndNotification) {
            setState(() {
              if (scrollController.position.pixels > 37) {
                isOnTop = false;
              } else {
                isOnTop = true;
              }
            });
          }

          return false;
        },
        child: CustomScrollView(
          controller: scrollController,
          physics: const ClampingScrollPhysics(),
          slivers: [
            DetailListWidget(
              pokemon: widget.pokemon,
              list: widget.list,
              controller: widget.controller,
              onChangePokemon: widget.onChangePokemon,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Container(
                      color: widget.pokemon.baseColor,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
