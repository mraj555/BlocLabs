import 'dart:async';

import 'package:bloclabs/bloc_pattern_architecture/config/routes/routes_name.dart';
import 'package:bloclabs/bloc_pattern_architecture/services/session_manager/session_controller.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    SessionController()
        .getUserFromPreference()
        .then((value) {
          if (SessionController().isLoggedIn ?? false) {
            Timer(Duration(seconds: 3), () => Navigator.pushNamedAndRemoveUntil(context, RoutesName.home, (route) => false));
          } else {
            Timer(Duration(seconds: 3), () => Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false));
          }
        })
        .onError((error, stackTrace) {
          Timer(Duration(seconds: 3), () => Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false));
        });
  }
}
