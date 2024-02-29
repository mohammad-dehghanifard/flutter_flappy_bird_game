import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flappy_bird_game/game/flappy_game.dart';
import 'package:flutter_flappy_bird_game/pages/game_over_page.dart';
import 'package:flutter_flappy_bird_game/pages/menu_page.dart';

void main() async {

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();

  final FlappyGame game = FlappyGame();
  await Flame.device.fullScreen();
  runApp(GameWidget(
      game: game,
    initialActiveOverlays: const [
      MenuPage.name
    ],
    overlayBuilderMap: {
        MenuPage.name : (context,_) => MenuPage(game: game),
        GameOverPage.name : (context,_) => GameOverPage(game: game)
    },
  ));
}

