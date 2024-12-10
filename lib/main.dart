import 'package:e_commerce_app/core/route/route_generation.dart';
import 'package:e_commerce_app/core/route/route_name.dart';
import 'package:e_commerce_app/core/theme/Theme_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: Theme_App.lightMode,
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.SplashVeiw,
      onGenerateRoute: Routegenerator.routegenerator,
      title: 'trade',
    );
  }
}

