import 'package:bloclabs/bloc_pattern_architecture/config/components/internet_exception.dart';
import 'package:bloclabs/bloc_pattern_architecture/config/components/round_button.dart';
import 'package:bloclabs/bloc_pattern_architecture/config/routes/routes_name.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundButton(title: 'Login', onPressed: () => Navigator.pushNamed(context, RoutesName.login)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: InternetException(onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
