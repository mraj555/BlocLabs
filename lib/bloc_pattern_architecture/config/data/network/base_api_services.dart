abstract class BaseAPIServices {
  Future<dynamic> onGetAPI(String url);

  Future<dynamic> onPostAPI(String url, var data);

  Future<dynamic> onDeleteAPI(String url);
}
