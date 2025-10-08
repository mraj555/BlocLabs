import 'package:bloclabs/bloc_pattern_architecture/config/data/network/network_services_api.dart';
import 'package:bloclabs/bloc_pattern_architecture/models/user/user_model.dart';
import 'package:bloclabs/bloc_pattern_architecture/repository/auth/login_repository.dart';

class LoginMockAPIRepository implements LoginRepository {
  final api = NetworkServicesAPI();

  @override
  Future<UserModel> onLoginAPI(dynamic credential) async {
    await Future.delayed(const Duration(seconds: 2));
    final response = {'token': 'asfdsd65f46sf'};
    return UserModel.fromJson(response);
  }
}
