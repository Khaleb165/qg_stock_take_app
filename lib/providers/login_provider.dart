import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/models/login_model.dart';
import 'package:qg_stock_take_app/models/station.dart';
import 'package:qg_stock_take_app/network/http_client.dart';

class LoginProvider extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  Future<void> login(String phoneNumber, String stationCode) async {
    final HttpClient httpClient = HttpClient();
    try {
      LoginModel credentials =
          LoginModel(phoneNumber: phoneNumber, stationCode: stationCode);
      String loginEndpoint = 'login';
      final response = await httpClient.post(
        loginEndpoint,
        credentials.toJson(),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        print(json);
        _isLoggedIn = true;
        notifyListeners();
      } else {
        throw Exception('Error in posting response');
      }
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }

  // get the list of stations
  final List<Station> _stations = [
    // Station(id: 1, name: 'Station 1'),
    // Station(id: 2, name: 'Station 2'),
    // Station(id: 3, name: 'Station 3'),
    // Station(id: 4, name: 'Station 4'),
    // Station(id: 5, name: 'Station 5'),
  ];

  List<Station> get stations => _stations;

  // get stations
  Future<void> getStations() async {
    final HttpClient httpClient = HttpClient();
    try {
      String stationEndpoint = '/station?order=name.asc&select=id,name';
      final response = await httpClient.get(stationEndpoint);
      if (response.isNotEmpty) {
        List<Station> stations =
            response.map<Station>((json) => Station.fromJson(json)).toList();
        _stations.addAll(stations);
        notifyListeners();
      } else {
        throw Exception('Error in getting response');
      }
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
