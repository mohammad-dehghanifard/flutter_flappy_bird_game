import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_flappy_bird_game/game/flappy_game.dart';
import 'package:flutter_flappy_bird_game/pages/menu_page.dart';

void main() {
  final FlappyGame game = FlappyGame();
  runApp(GameWidget(
      game: game,
    initialActiveOverlays: const [
      MenuPage.name
    ],
    overlayBuilderMap: {
        MenuPage.name : (context,_) => MenuPage(game: game)
    },
  ));
}

