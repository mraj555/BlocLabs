import 'dart:convert';
import 'dart:developer';

import 'package:bloclabs/bloc_pattern_architecture/models/user/user_model.dart';
import 'package:bloclabs/bloc_pattern_architecture/services/storage/local_storage.dart';

class SessionController {
  static final SessionController _session = SessionController._internal();

  final LocalStorage storage = LocalStorage();
  UserModel user = UserModel();
  bool? isLoggedIn;

  SessionController._internal() {
    isLoggedIn = false;
  }

  factory SessionController() => _session;

  Future<void> saveUserInPreference(dynamic user) async {
    storage.setValue('token', jsonEncode(user));
    storage.setValue('isLogin', 'true');
  }

  Future<void> getUserFromPreference() async {
    try {
      var user_data = await storage.getValue('token');
      var isLoggedIn = await storage.getValue('isLogin');

      if (user_data!.isNotEmpty) {
        SessionController().user = UserModel.fromJson(jsonDecode(user_data));
      }
      SessionController().isLoggedIn = isLoggedIn == 'true' ? true : false;
    } catch (e) {
      log("$e", name: "Storage Read Error");
    }
  }
}
