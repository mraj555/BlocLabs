import 'package:bloclabs/bloc_pattern_architecture/config/routes/routes_name.dart';
import 'package:bloclabs/bloc_pattern_architecture/views/home/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () => Navigator.pushNamed(context, RoutesName.home),
            child: Text('Home'),
          ),
        ),
      ),
    );
  }
}
