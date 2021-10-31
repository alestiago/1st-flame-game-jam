import 'package:flame/game.dart';
import 'package:flame_game_jam/src/features/game/flame/game.dart';
import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  // static final game = MyGame();

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: MyGame(),
      backgroundBuilder: (_) => Container(
        color: Theme.of(context).colorScheme.background,
      ),
    );
  }
}
