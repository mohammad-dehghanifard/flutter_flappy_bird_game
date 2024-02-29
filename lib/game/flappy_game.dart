import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/text.dart';
import 'package:flutter_flappy_bird_game/core/components/bird.dart';
import 'package:flutter_flappy_bird_game/core/components/game_back_ground.dart';
import 'package:flutter_flappy_bird_game/core/components/ground.dart';
import 'package:flutter_flappy_bird_game/core/components/pipe_gorup.dart';
import 'package:flutter_flappy_bird_game/core/config/game_config.dart';

class FlappyGame extends FlameGame with TapDetector,HasCollisionDetection {
  late Bird bird;
  late TextComponent scoreTxt;
  Timer interval = Timer(GameConfig.timer,repeat: true);
  @override
  Future<void> onLoad() async {
     addAll([
        GameBackGround(),
        GameGround(),
        bird = Bird(),
        scoreTxt = buildTextScore(),
     ]);
     interval.onTick = () => add(PipeGroup());
     super.onLoad();
  }

  @override
  void onTap() {
    super.onTap();
    bird.playerMovement();
  }

  TextComponent buildTextScore(){
    return TextComponent(
      position: Vector2(size.x / 2,size.y / 2 * 0.05),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold
        )
      )
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    scoreTxt.text = "Score : ${bird.score}";
    interval.update(dt);
  }
}