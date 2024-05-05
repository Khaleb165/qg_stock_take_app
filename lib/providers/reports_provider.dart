import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/models/station_report.dart';

import '../network/http_client.dart';
import '../offline/prefs_manager.dart';
import '../util/query_util.dart';

class ReportsProvider extends ChangeNotifier {
  // get the list of reports
  final List<StationReport> _reports = [];

  List<StationReport> get reports => _reports;

  // get reports
  Future<void> getReports() async {
    final HttpClient httpClient = HttpClient();
    try {
      // todo: get the station id from the prefs
      String reportEndpoint = QueryUtils.getStationReport(155);
      String token = PrefsManager.getToken();
      final response = await httpClient.get(reportEndpoint, token: token);

      if (response != null && response.isNotEmpty) {
        _reports.clear();
        for (var report in response) {
          _reports.add(StationReport.fromJson(report));
        }
        print('the reports are $_reports');
        notifyListeners();
      } else {
        throw Exception('Error in getting response');
      }
    } catch (error) {
      rethrow;
    }
  }
}
