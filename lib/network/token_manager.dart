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
  bool isLogin = PrefsManager.isLogIn();

  // String phoneNumber = PrefsManager.getStationPhone();
  // String stationCode = PrefsManager.getStationCode();

  Future<void> initialize() async {
    // check if islogin is true before you generate token, else don't generate token
    if (isLogin) {
      await _generateToken();
    } else {
      print('User is not logged in');
    }
    // Start timer to refresh token periodically
    _timer = Timer.periodic(const Duration(minutes: 59), (timer) async {
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

  Future<void> get refreshToken async {
    await _generateToken();
  }

  void dispose() {
    _timer.cancel();
  }
}
