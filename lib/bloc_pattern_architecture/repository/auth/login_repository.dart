import 'package:bloclabs/bloc_pattern_architecture/config/app_urls.dart';
import 'package:bloclabs/bloc_pattern_architecture/config/data/network/network_services_api.dart';
import 'package:bloclabs/bloc_pattern_architecture/models/user/user_model.dart';

class LoginRepository {
  final api = NetworkServicesAPI();

  Future<UserModel> onLoginAPI(dynamic credential) async {
    final response = await api.onPostAPI(AppURLs.login, credential);
    return UserModel.fromJson(response);
  }
}
