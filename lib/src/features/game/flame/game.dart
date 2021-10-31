import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_game_jam/src/features/game/flame/components/components.dart';
import 'package:flame_game_jam/src/features/game/flame/components/desk/desk.dart';
import 'package:flame_game_jam/src/features/game/flame/components/potions/potion_types.dart';
import 'package:flame_game_jam/src/features/game/flame/logic/logic.dart';
import 'package:flutter/material.dart';

class MyGame extends FlameGame with HasDraggableComponents, HasCollidables {
  MyGame({
    required Function(int) onGameOver,
  }) : _onGameOver = onGameOver;

  final Function(int) _onGameOver;

  var score = 0;
  final colorBloc = ColorBloc()..add(ColorStartEvent());

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // ignore: unawaited_futures
    FlameAudio.play('witch-start.mp3');

    await add(CauldronComponent());
    await add(EmptyPotionComponent());
    await add(
      DeskComponent(
        children: [
          PotionComponent(PotionType.red),
          PotionComponent(PotionType.green),
          PotionComponent(PotionType.blue),
        ],
      ),
    );
    await _buildScore(score);
  }

  // TODO: Implement Score BLOC instead.
  void onGameOver() {
    FlameAudio.play('witch-sad.mp3');
    _onGameOver(score);
  }

  void onScored() {
    score += 1;
    FlameAudio.play('witch-happy.mp3');
    colorBloc.add(ColorNewEvent());
  }

  Future _buildScore(int score) async {
    // TODO: Move and refactor, make use of Palette.
    final _style = TextPaint(
      config: const TextPaintConfig(
        color: Color(0xFFFFFFFFF),
        fontFamily: 'HennyPenny',
      ).withFontSize(25),
    );

    await add(
      TextComponent(score.toString(), textRenderer: _style)
        ..anchor = Anchor.topCenter
        ..x = size.x - (_style.config.fontSize * score.toString().length)
        ..y = 32.0,
    );
  }
}
