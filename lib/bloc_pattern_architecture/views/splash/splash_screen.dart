import 'package:bloclabs/bloc_pattern_architecture/config/components/internet_exception.dart';
import 'package:bloclabs/bloc_pattern_architecture/config/components/round_button.dart';
import 'package:bloclabs/bloc_pattern_architecture/config/routes/routes_name.dart';
import 'package:bloclabs/bloc_pattern_architecture/services/splash/splash_services.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices _services = SplashServices();

  @override
  void initState() {
    _services.isLogin(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FlutterLogo(style: FlutterLogoStyle.stacked, curve: Curves.bounceIn, size: 150),
        ),
      ),
    );
  }
}
