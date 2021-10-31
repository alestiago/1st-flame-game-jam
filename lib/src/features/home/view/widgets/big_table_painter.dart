import 'package:flutter/material.dart';

part 'big_table_painter.g.dart';

class BigTablePainter extends StatelessWidget {
  const BigTablePainter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        const scaleFactor = 0.7914438502673797;

        return CustomPaint(
          size: Size(width, (width * scaleFactor).toDouble()),
          painter: _RPSCustomPainter(),
        );
      },
    );
  }
}
