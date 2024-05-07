import 'package:qg_stock_take_app/models/customer_id.dart';

class StationWarehouse {
  CustomerId warehouse;

  StationWarehouse({
    required this.warehouse,
  });

  factory StationWarehouse.fromJson(Map<String, dynamic> json) {
    return StationWarehouse(
      warehouse: CustomerId.fromJson(json['warehouse']),
    );
  }

  Map<String, dynamic> toJson() => {
        'warehouse': warehouse.toJson(),
      };
}
