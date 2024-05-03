import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qg_stock_take_app/offline/prefs_manager.dart';

class TokenManager {
  final String _phoneNumber;
  final String _stationCode;
  late Timer _timer;

  TokenManager(this._phoneNumber, this._stationCode);
  String _token = PrefsManager.getToken();

  String get token => _token;
  static const String _baseUrl = 'http://10.234.75.203:3005';

  // String phoneNumber = PrefsManager.getStationPhone();
  // String stationCode = PrefsManager.getStationCode();

  Future<void> initialize() async {
    // Generate initial token
    await _generateToken();
    // Start timer to refresh token periodically
    _timer = Timer.periodic(const Duration(minutes: 30), (timer) async {
      await _generateToken();
    });
  }

  Future<void> _generateToken() async {
    final response = await http.post(
      Uri.parse('$_baseUrl/rpc/generatetoken'),
      body: {
        'phone_param': _phoneNumber,
        'code_param': _stationCode,
      },
    );
    if (response.statusCode == 200) {
      _token = jsonDecode(response.body)[0]['token'];
      print('token generated successfully: $_token');
      await PrefsManager.setToken(_token);
    } else {
      throw Exception('Failed to generate token: ${response.body}');
    }
  }

  // Future<void> _refreshTokenIfNeeded() async {
  //   final response = await http.get(
  //     Uri.parse('$_baseUrl/verify-token'),
  //     headers: {
  //       'Authorization': 'Bearer $_token',
  //     },
  //   );
  //   if (response.statusCode == 200) {
  //     // Token is valid, no action needed
  //     return;
  //   } else if (response.statusCode == 401 && response.body == "JWT expired") {
  //     // Token expired, generate new token
  //     await _generateToken();
  //   } else {
  //     throw Exception('Failed to verify token: ${response.body}');
  //   }
  // }

  void dispose() {
    _timer.cancel();
  }
}
