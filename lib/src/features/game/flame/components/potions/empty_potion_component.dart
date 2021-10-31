import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:flame_game_jam/src/features/game/flame/components/components.dart';
import 'package:flame_game_jam/src/features/game/flame/components/potions/colorful_liquid_component.dart';
import 'package:flame_game_jam/src/features/game/flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class EmptyPotionComponent extends SpriteComponent with HasGameRef<MyGame> {
  EmptyPotionComponent();

  static final Vector2 _spriteSize = Vector2(60, 60);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    size = _spriteSize;
    width = _spriteSize[0];
    height = _spriteSize[1];
    anchor = Anchor.center;
    position = Vector2(gameRef.size[0] / 2, 200);
    // TODO: Use empty bottle sprite.
    // sprite = await Sprite.load(_spritePath);

    await add(
      ColorfulLiquidComponent()
        ..anchor = Anchor.center
        ..position = Vector2(0, 0)
        ..size = Vector2(size[0], size[1]),
    );
  }
}
