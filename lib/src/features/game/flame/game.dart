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
        potions: [
          _redPotion,
          _bluePotion,
          _greenPotion,
        ],
      ),
    );
  }
}
