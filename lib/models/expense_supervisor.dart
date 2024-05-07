import 'package:qg_stock_take_app/models/station_expense_auth.dart';

class ExpenseSupervisor {
  int id;
  String name;
  List<StationExpenseAuth> stationExpenseAuth;

  ExpenseSupervisor({
    required this.id,
    required this.name,
    required this.stationExpenseAuth,
  });

  factory ExpenseSupervisor.fromJson(Map<String, dynamic> json) =>
      ExpenseSupervisor(
        id: json['id'],
        name: json['name'],
        stationExpenseAuth: List<StationExpenseAuth>.from(
            json['station_expense_auth']
                .map((x) => StationExpenseAuth.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'station_expense_auth':
            List<dynamic>.from(stationExpenseAuth.map((x) => x.toJson())),
      };
}
