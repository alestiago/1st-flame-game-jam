import 'package:flame_game_jam/src/features/game/game.dart';
import 'package:flame_game_jam/src/features/home/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: Scaffold(
        extendBody: true,
        body: Stack(
          children: [
            const Align(
              alignment: Alignment.bottomCenter,
              child: BigTablePainter(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () => _onPlay(context),
                child: Text(
                  'Play'.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'HennyPenny',
                    fontSize: 65,
                    letterSpacing: 65 * 0.15,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPlay(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (_) => GamePage()),
    );
  }
}
