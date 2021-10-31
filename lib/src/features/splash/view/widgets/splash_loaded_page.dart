import 'package:flutter/material.dart';

class SplashLoadedPage extends StatelessWidget {
  const SplashLoadedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Loaded'),
      ),
    );
  }
}
