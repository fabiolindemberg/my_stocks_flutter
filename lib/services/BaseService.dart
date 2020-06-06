
import 'package:http/http.dart' as http;

class BaseService {
  String baseUrl = "https://sheet.best/api/sheets/3061cdf5-5840-4129-833d-31004cb48413";
  String fromUrl(String endpoint) {
    String urlRequest = baseUrl + endpoint;
    print("Request to: $urlRequest");
    return urlRequest;
  }

  Future<http.Response> get(String url) {
    var httpClient = http.Client();
    try{
      return httpClient.get(url);
    } finally {
      httpClient.close();
    } 
  }

  Future<http.Response> post(String body, String url) {
    var httpClient = http.Client();
    try{
      return httpClient.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body
        );
    } finally {
      httpClient.close();
    } 
  }
}