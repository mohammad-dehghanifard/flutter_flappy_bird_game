import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter_flappy_bird_game/core/components/bird.dart';
import 'package:flutter_flappy_bird_game/core/components/game_back_ground.dart';
import 'package:flutter_flappy_bird_game/core/components/ground.dart';
import 'package:flutter_flappy_bird_game/core/components/pipe_gorup.dart';
import 'package:flutter_flappy_bird_game/core/config/game_config.dart';

class FlappyGame extends FlameGame with TapDetector,HasCollisionDetection {
  late Bird bird;
  Timer interval = Timer(GameConfig.timer,repeat: true);
  @override
  Future<void> onLoad() async {
     addAll([
        GameBackGround(),
        GameGround(),
        bird = Bird(),

     ]);
     interval.onTick = () => add(PipeGroup());
     super.onLoad();
  }

  @override
  void onTap() {
    super.onTap();
    bird.playerMovement();
  }


  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
  }
}