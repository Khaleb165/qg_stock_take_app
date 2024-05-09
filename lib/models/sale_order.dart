import 'dart:convert';

import 'bank.dart';
import 'credit_customer.dart';
import 'expense_supervisor.dart';
import 'nozzle.dart';
import 'station_expense_category.dart';
import 'station_product.dart';
import 'station_report.dart';
import 'station_warehouse.dart';
import 'tank_group.dart';

List<SaleOrder> saleOrderFromJson(String str) =>
    List<SaleOrder>.from(json.decode(str).map((x) => SaleOrder.fromJson(x)));

String saleOrderToJson(List<SaleOrder> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SaleOrder {
  int? id;
  String? name;
  bool? wholesale;
  bool? interTransfer;
  bool? locationFeature;
  bool? imageUpload;
  double? longitude;
  double? latitude;
  int? radius;
  int? compressImageQuality;
  bool? densityTemperatureFeature;
  String? bankPrefix;
  List<dynamic>? nozzleMeterReset;
  List<dynamic>? tankDipReset;
  List<Bank>? bank;
  List<CreditCustomer>? creditCustomer;
  List<StationProduct>? stationProduct;
  List<Nozzle>? nozzle;
  List<StationWarehouse>? stationWarehouse;
  List<ExpenseSupervisor>? expenseSupervisor;
  List<StationReport>? stationReport;
  List<StationExpenseCategory>? stationExpenseCategory;
  List<TankGroup>? tankGroup;

  SaleOrder(
      {this.id,
      this.name,
      this.wholesale,
      this.interTransfer,
      this.locationFeature,
      this.imageUpload,
      this.longitude,
      this.latitude,
      this.radius,
      this.compressImageQuality,
      this.densityTemperatureFeature,
      this.bankPrefix,
      this.nozzleMeterReset,
      this.tankDipReset,
      this.bank,
      this.creditCustomer,
      this.stationProduct,
      this.nozzle,
      this.stationWarehouse,
      this.expenseSupervisor,
      this.stationReport,
      this.stationExpenseCategory,
      this.tankGroup});

  SaleOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    wholesale = json['wholesale'];
    interTransfer = json['inter_transfer'];
    locationFeature = json['location_feature'];
    imageUpload = json['image_upload'];
    longitude = json['longitude'].toDouble();
    latitude = json['latitude'].toDouble();
    radius = json['radius'];
    compressImageQuality = json['compress_image_quality'];
    densityTemperatureFeature = json['density_temperature_feature'];
    bankPrefix = json['bank_prefix'];
    if (json['nozzle_meter_reset'] != null) {
      nozzleMeterReset = <dynamic>[];
      json['nozzle_meter_reset'].forEach((v) {
        nozzleMeterReset!.add(v);
      });
    }
    if (json['tank_dip_reset'] != null) {
      tankDipReset = <dynamic>[];
      json['tank_dip_reset'].forEach((v) {
        tankDipReset!.add(v);
      });
    }
    if (json['bank'] != null) {
      bank = <Bank>[];
      json['bank'].forEach((v) {
        bank!.add(Bank.fromJson(v));
      });
    }
    if (json['credit_customer'] != null) {
      creditCustomer = <CreditCustomer>[];
      json['credit_customer'].forEach((v) {
        creditCustomer!.add(CreditCustomer.fromJson(v));
      });
    }
    if (json['station_product'] != null) {
      stationProduct = <StationProduct>[];
      json['station_product'].forEach((v) {
        stationProduct!.add(StationProduct.fromJson(v));
      });
    }
    if (json['nozzle'] != null) {
      nozzle = <Nozzle>[];
      json['nozzle'].forEach((v) {
        nozzle!.add(Nozzle.fromJson(v));
      });
    }
    if (json['station_warehouse'] != null) {
      stationWarehouse = <StationWarehouse>[];
      json['station_warehouse'].forEach((v) {
        stationWarehouse!.add(StationWarehouse.fromJson(v));
      });
    }
    if (json['expense_supervisor'] != null) {
      expenseSupervisor = <ExpenseSupervisor>[];
      json['expense_supervisor'].forEach((v) {
        expenseSupervisor!.add(ExpenseSupervisor.fromJson(v));
      });
    }
    if (json['station_report'] != null) {
      stationReport = <StationReport>[];
      json['station_report'].forEach((v) {
        stationReport!.add(StationReport.fromJson(v));
      });
    }
    if (json['station_expense_category'] != null) {
      stationExpenseCategory = <StationExpenseCategory>[];
      json['station_expense_category'].forEach((v) {
        stationExpenseCategory!.add(StationExpenseCategory.fromJson(v));
      });
    }
    if (json['tank_group'] != null) {
      tankGroup = <TankGroup>[];
      json['tank_group'].forEach((v) {
        tankGroup!.add(TankGroup.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['wholesale'] = wholesale;
    data['inter_transfer'] = interTransfer;
    data['location_feature'] = locationFeature;
    data['image_upload'] = imageUpload;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['radius'] = radius;
    data['compress_image_quality'] = compressImageQuality;
    data['density_temperature_feature'] = densityTemperatureFeature;
    data['bank_prefix'] = bankPrefix;
    if (nozzleMeterReset != null) {
      data['nozzle_meter_reset'] = nozzleMeterReset!.map((v) => v).toList();
    }
    if (tankDipReset != null) {
      data['tank_dip_reset'] = tankDipReset!.map((v) => v).toList();
    }
    if (bank != null) {
      data['bank'] = bank!.map((v) => v.toJson()).toList();
    }
    if (creditCustomer != null) {
      data['credit_customer'] = creditCustomer!.map((v) => v.toJson()).toList();
    }
    if (stationProduct != null) {
      data['station_product'] = stationProduct!.map((v) => v.toJson()).toList();
    }
    if (nozzle != null) {
      data['nozzle'] = nozzle!.map((v) => v.toJson()).toList();
    }
    if (stationWarehouse != null) {
      data['station_warehouse'] =
          stationWarehouse!.map((v) => v.toJson()).toList();
    }
    if (expenseSupervisor != null) {
      data['expense_supervisor'] =
          expenseSupervisor!.map((v) => v.toJson()).toList();
    }
    if (stationReport != null) {
      data['station_report'] = stationReport!.map((v) => v.toJson()).toList();
    }
    if (stationExpenseCategory != null) {
      data['station_expense_category'] =
          stationExpenseCategory!.map((v) => v.toJson()).toList();
    }
    if (tankGroup != null) {
      data['tank_group'] = tankGroup!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
