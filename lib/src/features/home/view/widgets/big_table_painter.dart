import 'package:flutter/material.dart';

class BigTablePainter extends StatelessWidget {
  const BigTablePainter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        return CustomPaint(
          size: Size(width, (width * 0.7914438502673797).toDouble()),
          painter: _RPSCustomPainter(),
        );
      },
    );
  }
}

// ignore_for_file: prefer_final_locals
// ignore_for_file: omit_local_variable_types
// ignore_for_file: cascade_invocations
// ignore_for_file: non_constant_identifier_names

class _RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * -0.002673797, size.height * 0.1556605);
    path_0.lineTo(size.width * 0.06818182, 0);
    path_0.lineTo(size.width * 0.9237968, 0);
    path_0.lineTo(size.width, size.height * 0.1556605);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width * -0.002673797, size.height);
    path_0.lineTo(size.width * -0.002673797, size.height * 0.1556605);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = const Color(0xff44484D).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
