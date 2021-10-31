import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/game.dart';
import 'package:flame_game_jam/src/features/game/flame/components/components.dart';
import 'package:flame_game_jam/src/features/game/flame/components/desk/desk.dart';
import 'package:flame_game_jam/src/features/game/flame/components/potions/potion_types.dart';
import 'package:flutter/material.dart';

class MyGame extends FlameGame with HasDraggableComponents, HasCollidables {
  var score = 0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final _redPotion = PotionComponent(PotionType.red);
    final _bluePotion = PotionComponent(PotionType.blue);
    final _greenPotion = PotionComponent(PotionType.red);

    await add(CauldronComponent());
    await add(
      PotionComponent(PotionType.blue)
        ..anchor = Anchor.center
        ..position = Vector2(
          size[0] / 2,
          120,
        ),
    );
    await add(
      DeskComponent(
        children: [
          _redPotion,
          _bluePotion,
          _greenPotion,
        ],
      ),
    );

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

  void onGameOver() {}

  void onScored() {}
}
