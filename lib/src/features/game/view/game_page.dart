import 'package:flame/game.dart';
import 'package:flame_game_jam/src/features/game/flame/game.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late final MyGame game;

  @override
  void initState() {
    super.initState();
    game = MyGame(
      onGameOver: (score) => _onGameOver(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: game,
      backgroundBuilder: (_) => Container(
        color: Theme.of(context).colorScheme.background,
      ),
    );
  }

  void _onGameOver(BuildContext context) {
    Navigator.pop(context);
  }
}
