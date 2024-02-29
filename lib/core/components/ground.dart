import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flutter_flappy_bird_game/core/config/game_config.dart';
import 'package:flutter_flappy_bird_game/core/resource/assets.dart';
import 'package:flutter_flappy_bird_game/game/flappy_game.dart';

class GameGround extends ParallaxComponent<FlappyGame> with HasGameRef<FlappyGame>{
  @override
  Future<void> onLoad() async {
     final image = await Flame.images.load(GameAssets.ground);
     parallax = Parallax([
       ParallaxLayer(
         ParallaxImage(image,fill: LayerFill.none)
       )
     ]);
     add(RectangleHitbox(
       position: Vector2(0,gameRef.size.y - GameConfig.groundHeight),
       size: Vector2(gameRef.size.x,GameConfig.groundHeight)
     ));
     super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    parallax?.baseVelocity.x = GameConfig.gameSpeed;
  }
}