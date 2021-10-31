import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:flame_game_jam/src/features/game/flame/components/components.dart';
import 'package:flame_game_jam/src/features/game/flame/game.dart';

class CauldronComponent extends SpriteComponent with HasGameRef<MyGame> {
  CauldronComponent();

  // TODO: Make responsive to viewport.
  static final Vector2 _spriteSize = Vector2(326, 344);
  static const String _spritePath =
      'cauldron.png'; // FIXME: Make sprite squared.

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    size = _spriteSize;
    width = _spriteSize[0];
    height = _spriteSize[1];
    position = gameRef.size / 2;
    anchor = Anchor.center;
    sprite = await Sprite.load(_spritePath);

    // TODO: Add witch spoon component.
    await add(
      // FIXME: Mixture vertical space not alligned.
      CauldronMixtureComponent()
        ..position = Vector2(
          _spriteSize[0] / 2,
          position[1] -
              _spriteSize[1] -
              (CauldronMixtureComponent.spriteSize[1]),
        ),
    );
  }
}
