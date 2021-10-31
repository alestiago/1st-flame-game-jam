import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/geometry.dart';
import 'package:flame_game_jam/src/features/game/flame/components/components.dart';
import 'package:flutter/painting.dart';

class CauldronMixtureComponent extends PositionComponent
    with Hitbox, Collidable {
  // TODO: Rename static field.
  static final Vector2 spriteSize = Vector2(203, 48);
  Color color = const Color(0xFFFFFFFF);

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
      ..color = color;

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size[0] / 2, size[1] / 2),
        width: size[0],
        height: size[1],
      ),
      paint,
    );

    @override
    void onCollision(Set<Vector2> points, Collidable other) {
      if (other is PotionComponent) {
        // TODO: Update color mixture.
        print('Collision');
      }
    }

    @override
    void onCollisionEnd(Collidable other) {
      if (other is PotionComponent) {
        // TODO: Check if valid.
        print('Finished Collision');
      }
    }
  }
}
