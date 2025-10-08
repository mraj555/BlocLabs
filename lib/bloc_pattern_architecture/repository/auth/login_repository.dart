import 'package:bloclabs/bloc_pattern_architecture/models/user/user_model.dart';

abstract class LoginRepository {

  Future<UserModel> onLoginAPI(dynamic credential);
}
