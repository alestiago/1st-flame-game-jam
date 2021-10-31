import 'package:flutter/material.dart';

part 'potion_group_painter.g.dart';

class PotionGroupPainter extends StatelessWidget {
  const PotionGroupPainter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        const scaleFactor = 0.7662337662337663;

        return CustomPaint(
          size: Size(width, (width * scaleFactor).toDouble()),
          painter: _RPSCustomPainter(),
        );
      },
    );
  }
}
