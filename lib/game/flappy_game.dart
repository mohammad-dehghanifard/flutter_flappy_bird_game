import 'package:flame/game.dart';
import 'package:flutter_flappy_bird_game/core/components/bird.dart';
import 'package:flutter_flappy_bird_game/core/components/game_back_ground.dart';
import 'package:flutter_flappy_bird_game/core/components/ground.dart';

class FlappyGame extends FlameGame {
  late Bird bird;
  @override
  Future<void> onLoad() async {
     addAll([
        GameBackGround(),
        GameGround(),
        bird = Bird()
     ]);
     super.onLoad();
  }
}