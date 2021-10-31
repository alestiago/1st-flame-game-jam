import 'package:flame/components.dart';

enum PotionType { red, blue, green }

extension PotionTypeX on PotionType {
  String toSpritePath() {
    // TODO: Simplify logic.
    switch (this) {
      case PotionType.red:
        return 'potion-red.png';
      case PotionType.blue:
        return 'potion-blue.png';

      case PotionType.green:
        return 'potion-red.png';
    }
  }

  Vector2 spriteSize() {
    switch (this) {
      case PotionType.red:
        return Vector2(68, 122);
      case PotionType.blue:
        return Vector2(70, 122);
      case PotionType.green:
        return Vector2(64, 122);
    }
  }
}
