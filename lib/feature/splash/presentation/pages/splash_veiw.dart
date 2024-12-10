import 'dart:async';

import 'package:e_commerce_app/core/route/route_name.dart';
import 'package:flutter/material.dart';

class SplashVeiw extends StatefulWidget {
  const SplashVeiw({super.key});

  @override
  State<SplashVeiw> createState() => _SplashVeiwState();
}

class _SplashVeiwState extends State<SplashVeiw> {

  @override
  Widget build(BuildContext context) {
    setState(() {
      Timer(const Duration(seconds: 5), (){
        Navigator.pushReplacementNamed(context, RouteName.Home_page);
      });
    });
    return Image.asset('assets/image/Splash Screen.png');
  }
}
