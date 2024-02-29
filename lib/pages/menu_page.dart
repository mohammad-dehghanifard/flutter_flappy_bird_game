import 'package:flutter/material.dart';
import 'package:flutter_flappy_bird_game/core/resource/assets.dart';
import 'package:flutter_flappy_bird_game/game/flappy_game.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key, required this.game});
  final FlappyGame game;
  static const name = "mainMenu";
  @override
  Widget build(BuildContext context) {
    game.pauseEngine();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(GameAssets.menu),
            fit: BoxFit.cover
          )
        ),
        child: Image.asset(GameAssets.message),
      ),
    );
  }
}
