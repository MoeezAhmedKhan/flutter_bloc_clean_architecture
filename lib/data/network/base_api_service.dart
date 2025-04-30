abstract class BaseAPIService{
  Future<dynamic> getApi(String url);
  Future<dynamic> postApi(String url ,Map map);
}