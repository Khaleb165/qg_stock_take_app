import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'http_exceptions.dart';

class HttpClient {
  String baseUrl = 'http://10.234.75.203:3005/';

  // http get
  Future get(String endpoint, {String token = ''}) async {
    try {
      final response = await http.get(
          Uri.parse(
            baseUrl + endpoint,
          ),
          headers: {
            'Authorization': 'Bearer $token',
          });
      if (response.statusCode == 200) {
        print(response.body);
        List<dynamic> json =
            response.body.isEmpty ? {} : jsonDecode(response.body);

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
  Future post(String endPoint, [Map<String, dynamic>? body]) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl + endPoint),
        body: body,
      );
      // print(baseUrl + endPoint);
      //   print(response.body);
      // print(response.statusCode);

      if (response.statusCode == 200) {
        List<dynamic> json =
            response.body.isEmpty ? {} : jsonDecode(response.body);
        print('the response is $json');

        return json;
      } else {
        throw Exception(response);
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

//   import 'dart:convert';
// import 'package:http/http.dart' as http;

// Future get(String endpoint, [Map<String, String>? queryParameters, String token = '']) async {
//   Uri uri = Uri.https('your-base-url.com', endpoint, queryParameters);
//   http.Response response;

//   try {
//     response = await http.get(uri, headers: {'Authorization': 'Bearer $token'});
//     return jsonDecode(response.body);
//   } catch (e) {
//     throw ('Error: $e');
//   }
// }
}
