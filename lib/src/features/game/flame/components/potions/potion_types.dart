enum PotionType { red, blue, green }

extension PotionTypeX on PotionType {
  String toSpritePath() {
    return 'red-potion.png';
  }
}
