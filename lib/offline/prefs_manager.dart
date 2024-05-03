import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static final PrefsManager _instance = PrefsManager.internal();

  factory PrefsManager() => _instance;

  static SharedPreferences? _prefs;

  PrefsManager.internal();

  static const String tokenKey = 'token';
  static const String stationCode = 'station_code';
  static const String stationPhone = 'station_phone';
  static const String stationName = 'station_name';
  static const String isLoggedIn = 'isLoggedIn';
  static const String teamName = 'team_name';

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setToken(String token) async {
    await _prefs?.setString(tokenKey, token);
  }

  static String getToken() {
    return _prefs?.getString(tokenKey) ?? '';
  }

  static Future<void> setStationCode(String code) async {
    await _prefs?.setString(stationCode, code);
  }

  static String getStationCode() {
    return _prefs?.getString(stationCode) ?? '';
  }

  static Future<void> setStationPhone(String phone) async {
    await _prefs?.setString(stationPhone, phone);
  }

  static String getStationPhone() {
    return _prefs?.getString(stationPhone) ?? '';
  }

  static Future<void> setTeamName(String name) async {
    await _prefs?.setString(stationName, name);
  }

  static String getTeamName() {
    return _prefs?.getString(stationName) ?? '';
  }

  static Future<void> setIsLoggedIn(bool isLogin) async {
    await _prefs?.setBool(isLoggedIn, isLogin);
  }

  static bool isLogIn() {
    return _prefs?.getBool(isLoggedIn) ?? false;
  }

  static Future<void> clearPrefs() async {
    await _prefs?.clear();
  }
}
