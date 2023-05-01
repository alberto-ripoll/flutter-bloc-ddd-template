import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api_response.dart';

class HttpClient {
  HttpClient();

  Future<ApiResponse> get(String endpoint) async {
    final url = Uri.parse(endpoint);
    final response = await http.get(url);

    return ApiResponse(
        body: response.body, statusCode: response.statusCode.toString());
  }

  Future<ApiResponse> post(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse(endpoint);
    final headers = {'Content-Type': 'application/json'};
    final jsonBody = json.encode(body);

    final response = await http.post(url, headers: headers, body: jsonBody);

    return ApiResponse(
        body: response.body, statusCode: response.statusCode.toString());
  }

  Future<ApiResponse> put(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse(endpoint);
    final headers = {'Content-Type': 'application/json'};
    final jsonBody = json.encode(body);

    final response = await http.put(url, headers: headers, body: jsonBody);
    return ApiResponse(
        body: response.body, statusCode: response.statusCode.toString());
  }

  Future<ApiResponse> delete(String endpoint) async {
    final url = Uri.parse(endpoint);
    final response = await http.delete(url);

    return ApiResponse(
        body: response.body, statusCode: response.statusCode.toString());
  }
}
