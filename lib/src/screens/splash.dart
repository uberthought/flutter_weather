import 'package:flutter/material.dart';
import 'package:flutter_weather/src/routing/routing.dart';

class Splash extends MaterialPage {
  const Splash() : super(child: const _Splash());
}

class _Splash extends StatefulWidget {
  const _Splash({Key? key}) : super(key: key);

  @override
  State<_Splash> createState() => _SplashState();
}

class _SplashState extends State<_Splash> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1), () {
        RouteStateScope.of(context).go('/');
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => const Scaffold(body: Text('splash'));
}
