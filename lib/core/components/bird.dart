import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_flappy_bird_game/core/config/game_config.dart';
import 'package:flutter_flappy_bird_game/core/resource/assets.dart';
import 'package:flutter_flappy_bird_game/core/resource/bird_movement.dart';
import 'package:flutter_flappy_bird_game/game/flappy_game.dart';

class Bird extends SpriteGroupComponent<BirdMovement> with HasGameRef<FlappyGame>,CollisionCallbacks {
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
     add(CircleHitbox());
  }


  @override
  void update(double dt) {
    position.y += GameConfig.birdVelocity * dt;
    if(position.y < 1) {
      gameOver();
    }
    super.update(dt);
  }


  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,PositionComponent other,) {
    super.onCollisionStart(intersectionPoints, other);
    gameOver();
  }

  void playerMovement(){
    add(
      MoveByEffect(
          Vector2(0, GameConfig.gravity),
          EffectController(duration: 0.2,curve: Curves.decelerate),
          onComplete: () => current = BirdMovement.down,
      )
    );
    current = BirdMovement.up;
  }

  void gameOver() {
    gameRef.pauseEngine();
  }

}