import 'package:bloclabs/bloc_pattern_architecture/config/routes/routes_name.dart';
import 'package:flutter/material.dart';

import 'package:bloclabs/bloc_pattern_architecture/views/view.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(body: Center(child: Text("No Route found."))),
        );
    }
  }
}
