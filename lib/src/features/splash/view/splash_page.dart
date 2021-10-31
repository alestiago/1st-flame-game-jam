import 'package:flame_game_jam/src/features/splash/view/widgets/splash_loading_page.dart';
import 'package:flame_game_jam/src/features/splash/view/widgets/widget.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({
    Key? key,
    required this.loader,
  }) : super(key: key);

  final Future Function() loader;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: loader(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashLoadingPage();
        }

        return const SplashLoadedPage();
      },
    );
  }
}
