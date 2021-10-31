import 'package:flutter/material.dart';

class SplashLoadingPage extends StatelessWidget {
  const SplashLoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Loading'),
      ),
    );
  }
}
