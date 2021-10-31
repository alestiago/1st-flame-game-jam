import 'package:flame/components.dart';
import 'package:flame_game_jam/src/features/game/flame/components/potions/potions.dart';
import 'package:flame_game_jam/src/features/game/flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class DeskComponent extends PositionComponent with HasGameRef<MyGame> {
  DeskComponent({
    required List<PotionComponent> potions,
  }) : _potions = potions;

  // TODO: Remove magic color by using a Theme.
  static final _paint = Paint()..color = Color(0xFF44484D);
  final List<PotionComponent> _potions;
  late final Vector2 _deskSize;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    _declareProperties();
    await _layoutChildren(
      horizontalPadding: Vector2.all(20),
    );
    _addEventListners();
  }

  void _declareProperties() {
    _deskSize = Vector2(gameRef.size[0], PotionComponent.spriteSize[1] / 2);
    size = Vector2(
      gameRef.size[0],
      _deskSize[1] + PotionComponent.spriteSize[1],
    );
    position = Vector2(0, gameRef.size[1] - size[1]);
  }

  Future<void> _layoutChildren({
    Vector2? horizontalPadding,
  }) async {
    horizontalPadding = horizontalPadding ?? Vector2.all(0);
    final spaceBetween = _calculateHorizontalSpaceBetween(
      width: size[0],
      horizontalPadding: horizontalPadding,
      children: _potions,
    );

    var horizontalDisplacement =
        -PotionComponent.spriteSize[0] + horizontalPadding[0];
    for (var i = 0; i < _potions.length; i++) {
      final potion = _potions[i];

      // FIXME: Allow PositionedComponent to have a preffered size
      // before being mounted.
      final x = PotionComponent.spriteSize[0] + spaceBetween;
      final position = Vector2(
        x + horizontalDisplacement,
        _deskSize[1] / 2,
      );
      horizontalDisplacement += x;

      potion.position = position;
      if (!potion.isMounted) {
        await add(potion);
      }
    }
  }

  void _addEventListners() {
    for (final potionComponent in _potions) {
      potionComponent.onDropped = _layoutChildren;
    }
  }

  static double _calculateHorizontalSpaceBetween({
    required double width,
    required List<PositionComponent> children,
    required Vector2 horizontalPadding,
  }) {
    // FIXME: Allow PositionedComponent to have a preffered size
    // before being mounted.
    /* var occupiedWidth = 0.0;
    for (final child in children) {
      occupiedWidth += child;
    } */

    final occupiedWidth = PotionComponent.spriteSize[0] * children.length;
    final availableWidth = width - horizontalPadding[0] - horizontalPadding[1];
    return (availableWidth - occupiedWidth) / (children.length + 1);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    canvas.drawRect(
      Offset(0, size[1] - _deskSize[1]) & _deskSize.toSize(),
      _paint,
    );
  }
}
