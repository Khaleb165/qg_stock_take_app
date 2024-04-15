import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'http_exceptions.dart';

class HttpClient {
  String baseUrl = 'http://www.boredapi.com/api/';

  // http get
  Future get(String endpoint) async {
    try {
      final response = await http.get(Uri.parse(baseUrl + endpoint));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);

        return json;
      } else {
        throw Exception('Error in getting response');
      }
    } on SocketException {
      throw const NetworkException("No internet connection!");
    } on HttpException catch (e) {
      throw ServerException("Server error: $e - ${e.message}");
    } catch (error) {
      rethrow;
    }
  }

  // http post
  Future post(Map<String, dynamic> body) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        body: body,
      );

      if (response.statusCode == 201) {
        Map<String, dynamic> json = jsonDecode(response.body);

        return json;
      } else {
        throw Exception('Error in posting response');
      }
    } on SocketException {
      throw const NetworkException("No internet connection!");
    } on HttpException catch (e) {
      throw ServerException("Server error: $e - ${e.message}");
    } catch (error) {
      rethrow;
    }
  }

  // http patch
  Future patch(Map<String, dynamic> body) async {
    try {
      final response = await http.patch(
        Uri.parse(baseUrl),
        body: body,
      );

      if (response.statusCode == 200) {
        // ignore: avoid_print
        print('successfully modified');
      } else {
        throw Exception('Error in modifying response');
      }
    } on SocketException {
      throw const NetworkException("No internet connection!");
    } on HttpException catch (e) {
      throw ServerException("Server error: $e - ${e.message}");
    } catch (error) {
      rethrow;
    }
  }
}
