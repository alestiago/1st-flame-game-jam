import 'package:flame/components.dart';
import 'package:flame_game_jam/src/features/game/flame/components/potions/potions.dart';
import 'package:flame_game_jam/src/features/game/flame/core/core.dart';
import 'package:flame_game_jam/src/features/game/flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class DeskComponent extends PositionComponent with HasGameRef<MyGame> {
  DeskComponent({
    required List<PreferredSizeComponent> children,
  })  : assert(children.isNotEmpty),
        _children = children;

  // TODO: Remove magic color by using a Theme.
  static final _paint = Paint()..color = Color(0xFF44484D);
  final List<PreferredSizeComponent> _children;
  late final Vector2 _deskSize;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    _declareProperties();
    await _layoutChildren(
      horizontalPadding: Vector2.all(20),
    );
    _addEventListeners();
  }

  static PreferredSizeComponent tallestComponent(
    List<PreferredSizeComponent> children,
  ) {
    assert(
      children.isNotEmpty,
      "Can't find the tallest child of an empty list.",
    );

    var tallestChild = children[0];
    for (final child in children) {
      if (child.preferredSize[1] > tallestChild.preferredSize[1]) {
        tallestChild = child;
      }
    }
    return tallestChild;
  }

  void _declareProperties() {
    final tallestChild = tallestComponent(_children);
    _deskSize = Vector2(gameRef.size[0], tallestChild.preferredSize[1] / 2);
    size = Vector2(
      gameRef.size[0],
      _deskSize[1] + tallestChild.preferredSize[1],
    );
    position = Vector2(0, gameRef.size[1] - size[1]);
  }

  Future<void> _layoutChildren({
    Vector2? horizontalPadding,
  }) async {
    // FIXME: Layout algorithm.
    horizontalPadding = horizontalPadding ?? Vector2.all(0);
    final spaceBetween = _calculateHorizontalSpaceEvenly(
      width: size[0],
      horizontalPadding: horizontalPadding,
      children: _children,
    );

    var horizontalDisplacement = 0.0;
    for (var i = 0; i < _children.length; i++) {
      dynamic child;
      child = _children[i];
      var position = Vector2.all(0);
      if (child is PreferredSizeComponent) {
        if (i == 0) {
          horizontalDisplacement =
              -child.preferredSize[0] + horizontalPadding[0];
        }

        final x = child.preferredSize[0] + spaceBetween;
        position = Vector2(
          x + horizontalDisplacement,
          _deskSize[1] / 2,
        );
        horizontalDisplacement += x;
      }

      if (child is PositionComponent) {
        child.position = position;
        if (!child.isMounted) {
          await add(child);
        }
      }
    }
  }

  void _addEventListeners() {
    for (final child in _children) {
      if (child is PotionComponent) {
        child.onDropped = _layoutChildren;
      }
    }
  }

  static double _calculateHorizontalSpaceEvenly({
    required double width,
    required List<PreferredSizeComponent> children,
    required Vector2 horizontalPadding,
  }) {
    var occupiedWidth = 0.0;
    for (final child in children) {
      occupiedWidth += child.preferredSize[0];
    }

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
