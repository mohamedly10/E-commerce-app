import 'dart:async';
import 'package:flutter/material.dart';

import '../../../../core/route/route_name.dart';

class SplashVeiw extends StatefulWidget {
  const SplashVeiw({super.key});

  @override
  State<SplashVeiw> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashVeiw> {
  @override
  void initState() {
    super.initState();
    // Initialize the Timer only once in initState
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, RouteName.Layout_Page,);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/image/Splash Screen.png'),
      ),
    );
  }
}
