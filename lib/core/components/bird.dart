import 'package:flame/components.dart';
import 'package:flutter_flappy_bird_game/core/resource/assets.dart';
import 'package:flutter_flappy_bird_game/core/resource/bird_movement.dart';
import 'package:flutter_flappy_bird_game/game/flappy_game.dart';

class Bird extends SpriteGroupComponent<BirdMovement> with HasGameRef<FlappyGame> {
  @override
  Future<void> onLoad() async {
     final idleBirdSprite = await gameRef.loadSprite(GameAssets.birdIdle);
     final upBirdSprite = await gameRef.loadSprite(GameAssets.birdUp);
     final downBirdSprite = await gameRef.loadSprite(GameAssets.birdDown);
     size = Vector2(50, 40);
     current = BirdMovement.idle;
     position = Vector2(gameRef.size.x / 6 , gameRef.size.y / 2);
     sprites = {
       BirdMovement.idle : idleBirdSprite,
       BirdMovement.up : upBirdSprite,
       BirdMovement.down : downBirdSprite,
     };
     super.onLoad();
  }
}