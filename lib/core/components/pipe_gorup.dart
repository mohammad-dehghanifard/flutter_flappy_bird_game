import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter_flappy_bird_game/core/components/pipe.dart';
import 'package:flutter_flappy_bird_game/core/config/game_config.dart';
import 'package:flutter_flappy_bird_game/core/resource/pipe_position.dart';
import 'package:flutter_flappy_bird_game/game/flappy_game.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyGame> {
  final Random _random = Random();

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;

    final heightMinusGround = gameRef.size.y - GameConfig.gameSpeed;
    final spacing = 100 + _random.nextDouble() * (heightMinusGround / 4);
    final centerY = spacing +
        _random.nextDouble() * (heightMinusGround - spacing);
    super.onLoad();
    addAll([
      Pipe(pipePosition: PipePosition.up, height: centerY - spacing / 2),
      Pipe(
          pipePosition: PipePosition.down,
          height: heightMinusGround - (centerY + spacing / 2)),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= GameConfig.gameSpeed * dt;
  }
}