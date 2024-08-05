import 'package:http/http.dart' as http;


class ServiceApi {
  final String baseUrl;

  ServiceApi({required this.baseUrl});

  //GET METHOD
  Future<http.Response> getMethod(String endpoint, {Map<String, String>? headers}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final response = await http.get(url, headers: headers).timeout(const Duration(seconds: 30));

    return response;
  }
}