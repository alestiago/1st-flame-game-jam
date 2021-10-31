import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame_game_jam/src/features/game/flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ColorfulLiquidComponent extends PositionComponent
    with HasGameRef<MyGame> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = gameRef.colorBloc.state.color;

    canvas.drawRect(
      Rect.fromCenter(
        center: Offset.zero,
        width: size[0],
        height: size[1],
      ),
      paint,
    );
  }
}
