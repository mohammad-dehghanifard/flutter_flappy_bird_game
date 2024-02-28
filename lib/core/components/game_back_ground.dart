import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter_flappy_bird_game/core/resource/assets.dart';
import 'package:flutter_flappy_bird_game/game/flappy_game.dart';

class GameBackGround extends SpriteComponent with HasGameRef<FlappyGame> {
  @override
  Future<void> onLoad() async {
     final backGround = await Flame.images.load(GameAssets.gameBackGround);
     sprite = Sprite(backGround);
     super.onLoad();
  }
}