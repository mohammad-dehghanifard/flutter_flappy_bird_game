import 'package:flutter/material.dart';
import 'package:flutter_flappy_bird_game/core/resource/assets.dart';
import 'package:flutter_flappy_bird_game/game/flappy_game.dart';

class GameOverPage extends StatelessWidget {
  const GameOverPage({super.key, required this.game});
  final FlappyGame game;
  static const name = "gameOver";
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(GameAssets.gameOver),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: onRestartTap,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                child: const Text("Restart!",style: TextStyle(color: Colors.black38),))
          ],
        ),
      ),
    );
  }

  void onRestartTap() {
    game.bird.resetGame();
    game.overlays.remove(name);
    game.resumeEngine();
  }
}
