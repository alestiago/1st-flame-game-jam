import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/game.dart';
import 'package:flame_game_jam/src/features/game/flame/components/components.dart';
import 'package:flame_game_jam/src/features/game/flame/components/desk/desk.dart';
import 'package:flame_game_jam/src/features/game/flame/components/potions/potion_types.dart';
import 'package:flutter/material.dart';

class MyGame extends FlameGame with HasDraggableComponents, HasCollidables {
  late final PotionComponent _redPotion;
  late final PotionComponent _bluePotion;
  late final PotionComponent _greenPotion;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    _redPotion = PotionComponent(PotionType.red);
    _bluePotion = PotionComponent(PotionType.red);
    _greenPotion = PotionComponent(PotionType.red);

    await add(CauldronComponent());
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
    var score = 20;
    await add(
      TextComponent(score.toString(), textRenderer: _style)
        ..anchor = Anchor.topCenter
        ..x = size.x - (_style.config.fontSize * score.toString().length)
        ..y = 32.0,
    );
  }
}
