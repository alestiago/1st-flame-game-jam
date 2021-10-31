import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/geometry.dart';
import 'package:flame_game_jam/src/features/game/flame/components/components.dart';
import 'package:flame_game_jam/src/features/game/flame/flame.dart';
import 'package:flame_game_jam/src/features/game/flame/logic/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CauldronMixtureComponent extends PositionComponent
    with Hitbox, Collidable, HasGameRef<MyGame> {
  // TODO: Refactor static field..
  static final Vector2 spriteSize = Vector2(203, 48);
  bool _poured = false;
  Color _color = const Color(0xFFFFFFFF);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    size = spriteSize;
    width = spriteSize[0];
    height = spriteSize[1];
    anchor = Anchor.center;

    collidableType = CollidableType.passive;
    final hitbox = HitboxRectangle(relation: Vector2(1, 1));
    addHitbox(hitbox);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = _color;

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size[0] / 2, size[1] / 2),
        width: size[0],
        height: size[1],
      ),
      paint,
    );
  }

  @override
  void onCollision(Set<Vector2> _, Collidable other) {
    const _colorOffset = ColorBloc.colorOffsetValue;

    if (other is PotionComponent && !_poured) {
      switch (other.type) {
        case PotionType.red:
          _color = _color.withBlue((_color.blue - _colorOffset).clamp(0, 255));
          _color =
              _color.withGreen((_color.green - _colorOffset).clamp(0, 255));
          break;
        case PotionType.blue:
          _color = _color.withRed((_color.red - _colorOffset).clamp(0, 255));
          _color =
              _color.withGreen((_color.green - _colorOffset).clamp(0, 255));
          break;
        case PotionType.green:
          _color = _color.withRed((_color.red - _colorOffset).clamp(0, 255));
          _color = _color.withBlue((_color.blue - _colorOffset).clamp(0, 255));
          break;
      }
      _poured = true;
    }
  }

  @override
  void onCollisionEnd(Collidable other) {
    if (other is PotionComponent) {
      _poured = false;
      if (_color == Colors.black) {
        gameRef.onGameOver();
      } else if (_color == gameRef.colorBloc.state.color) {
        gameRef.onScored();
      }
    }
  }
}
