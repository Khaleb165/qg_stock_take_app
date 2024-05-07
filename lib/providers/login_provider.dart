import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/models/login_model.dart';
import 'package:qg_stock_take_app/models/station.dart';
import 'package:qg_stock_take_app/network/http_client.dart';
import 'package:qg_stock_take_app/offline/prefs_manager.dart';
import 'package:qg_stock_take_app/util/query_util.dart';

class LoginProvider extends ChangeNotifier {
  Timer? _inactivityTimer;

  Future<void> login(String phoneNumber, String stationCode) async {
    final HttpClient httpClient = HttpClient();

    try {
      LoginModel credentials =
          LoginModel(phoneNumber: phoneNumber, stationCode: stationCode);
      String loginEndpoint = 'rpc/stock_authuser';
      // print('the credentials are $phoneNumber and $stationCode');
      await PrefsManager.setStationCode(stationCode);
      await PrefsManager.setStationPhone(phoneNumber);

      final response = await httpClient.post(
        loginEndpoint,
        credentials.toJson(),
      );
      debugPrint('the response is ----- $response');
      // Extract the name from the response

      if (response != null && response.isNotEmpty) {
        String teamName = response[0]['name'];
        debugPrint('the name is ----- $teamName');

        await PrefsManager.setTeamName(teamName);
        await PrefsManager.setIsLoggedIn(true);
        resetInactivityTimer();
        notifyListeners();
      } else {
        throw Exception('Error in getting response');
      }
    } catch (error) {
      debugPrint('the error is $error');
      rethrow;
    }
  }

  Future<void> logout() async {
    await PrefsManager.clearPrefs();
    _inactivityTimer?.cancel();
    _inactivityTimer = null;
    notifyListeners();
    notifyListeners();
  }

  // get the list of stations
  final List<Station> _stations = [];

  List<Station> get stations => _stations;

  // get stations
  Future<void> getStations() async {
    final HttpClient httpClient = HttpClient();
    try {
      String stationEndpoint = QueryUtils.getStations();
      String token = PrefsManager.getToken();
      // print('the token from getToken is $token');
      final response = await httpClient.get(stationEndpoint, token: token);
      if (response.isNotEmpty) {
        List<Station> stations =
            response.map<Station>((json) => Station.fromJson(json)).toList();
        _stations.addAll(stations);
        // print('the stations are $response');
        // String stationId = response['id'];
        // debugPrint('the station id is ----- $stationId');

        // await PrefsManager.setStationId(stationId);
        notifyListeners();
      } else {
        throw Exception(response);
      }
    } catch (error) {
      debugPrint('the error is $error');
      rethrow;
    }
  }

  // logout after the user has been inactive for an hour
  void resetInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(const Duration(hours: 1), logout);
  }
}
