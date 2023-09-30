import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = "http://localhost:8080";


  Future<Map<String, dynamic>> _postRequest(String url,
      Map<String, dynamic> body, Map<String, String> headers) async {

    final response = await http.post(Uri.parse('$baseUrl$url'),
        headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  Future<Map<String, dynamic>> register(Map<String, dynamic> userData) async {
    Map<String, String> headers = {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json; charset=UTF-8',
    };

    return await _postRequest('/api/users/register', userData, headers);
  }

  Future<Map<String, dynamic>> login(String username, String password) async {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    Map<String, dynamic> body = {'username': username, 'password': password};

    return await _postRequest('/api/users/login', body, headers);
  }
}
