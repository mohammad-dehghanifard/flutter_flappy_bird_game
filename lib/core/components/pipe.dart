import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter_flappy_bird_game/core/config/game_config.dart';
import 'package:flutter_flappy_bird_game/core/resource/assets.dart';
import 'package:flutter_flappy_bird_game/core/resource/pipe_position.dart';
import 'package:flutter_flappy_bird_game/game/flappy_game.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappyGame> {
  Pipe({required this.pipePosition,required this.height});
  @override
  final double height;
  final PipePosition pipePosition;

  @override
  Future<void> onLoad() async {
    final pipe = await Flame.images.load(GameAssets.pipe);
    final rotatePipe = await Flame.images.load(GameAssets.rotatedPipe);
    size = Vector2(50, height);
    switch(pipePosition) {
      case PipePosition.up:
        position.y = 0;
        sprite = Sprite(pipe);
      case PipePosition.down :
        position.y = gameRef.size.y - size.y - GameConfig.groundHeight;
        sprite = Sprite(rotatePipe);
    }
    add(RectangleHitbox());
    super.onLoad();
  }
  
}