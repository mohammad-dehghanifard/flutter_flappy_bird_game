import 'package:flame/game.dart';
import 'package:flutter_flappy_bird_game/core/components/game_back_ground.dart';

class FlappyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
     addAll([
        GameBackGround()
     ]);
     super.onLoad();
  }
}