import 'package:flame_game_jam/src/features/features.dart';
import 'package:flame_game_jam/src/theme/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlameGameJam',
      theme: CustomThemeData.theme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
