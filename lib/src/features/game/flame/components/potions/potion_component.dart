import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/geometry.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';

import 'package:flame_game_jam/src/features/game/flame/components/components.dart';
import 'package:flame_game_jam/src/features/game/flame/components/potions/potion_types.dart';
import 'package:flame_game_jam/src/features/game/flame/core/core.dart';
import 'package:flame_game_jam/src/features/game/flame/game.dart';

class PotionComponent extends SpriteAnimationComponent
    with
        HasGameRef<MyGame>,
        Draggable,
        Hitbox,
        Collidable,
        PreferredSizeComponent {
  PotionComponent(this.type);

  final PotionType type;
  Function()? onDropped;
  late final SpriteAnimation _fullAnimation;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    size = spriteSize;
    width = spriteSize[0];
    height = spriteSize[1];
    anchor =
        Anchor(((spriteSize[0] - preferredSize[0]) / 2) / spriteSize[0], 0);

    collidableType = CollidableType.active;
    final hitbox = HitboxRectangle(
        relation: Vector2(
      preferredSize[0] / spriteSize[0],
      preferredSize[1] / spriteSize[1],
    ));
    addHitbox(hitbox);

    await _loadAnimations().then((_) => {animation = _fullAnimation});
  }

  Future<void> _loadAnimations() async {
    final spriteSheet = SpriteSheet(
        image: await gameRef.images.load(type.toSpritePath()),
        srcSize: spriteSize);

    _fullAnimation = spriteSheet.createAnimation(row: 0, stepTime: 0.17, to: 5);
    // TODO: Load pouring animation.
  }

  Vector2? dragDeltaPosition;
  bool get isDragging => dragDeltaPosition != null;

  @override
  bool onDragStart(int pointerId, DragStartInfo info) {
    dragDeltaPosition = info.eventPosition.game - position;
    return false;
  }

  @override
  bool onDragUpdate(int pointerId, DragUpdateInfo info) {
    final localCoords = info.eventPosition.game;
    position = localCoords - dragDeltaPosition!;
    return false;
  }

  @override
  bool onDragEnd(int pointerId, DragEndInfo info) {
    dragDeltaPosition = null;
    if (onDropped != null) onDropped!();
    return false;
  }

  @override
  bool onDragCancel(int pointerId) {
    dragDeltaPosition = null;
    return false;
  }

  @override
  void onCollision(Set<Vector2> points, Collidable other) {
    if (other is CauldronMixtureComponent) {
      // TODO: Set pouring animation.
    }
  }

  @override
  void onCollisionEnd(Collidable other) {
    if (other is CauldronMixtureComponent) {
      // TODO: Remove pouring animation.
    }
  }

  @override
  Vector2 get preferredSize {
    return type.spriteSize();
  }

  Vector2 get spriteSize {
    return Vector2.all(max(preferredSize[0], preferredSize[1]));
  }
}
