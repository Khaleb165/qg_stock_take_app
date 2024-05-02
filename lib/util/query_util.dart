class QueryUtils {
  static String getStations() {
    return 'station?order=name.asc&select=id,name';
  }

  static String getStationReport(int stationId) {
    return 'stock_station_report?order=id.desc&station_id=eq.$stationId&limit=6&select=id,station_id,date,officer_id,created_time,stock_bank_deposit(deposited_by,amount,bank_id,is_cheque,cheque_bank,cheque_number,transaction_ref),stock_loss(id,tank_id,date,dehydrated_closing_dips,meter_sales,inventory_at_date_liters,inventory_valuation_liters,inventory_at_date_ghc,inventory_valuation_ghc,date),stock_product_report(product_id,id,state,stock_report_line(opening_meter,closing_meter,rtt,meter_sales,comment,nozzle_id,nozzle_image,time_taken),stock_stock(closing_dip,opening_dip,tank_id,water_level,closing_dip_measured),stock_credit_sale(unit_price,customer_id,wholesale,quantity,tank_id),stock_cash_sale(unit_price,quantity),stock_genset(unit_price,quantity,type),stock_discharge(id,new_discharge,truck_number,invoice_number,type,delivery_shortage,delivery_overage,discharge_main_id(tank_discharge(tank_id,quantity))),stock_station_transfer(quantity,type,warehouse_id,vehicle_number,transporter,cost_unit_price,invoice_number,tank_id),stock_goods_in_transit(id,new_discharge,invoice_number,truck_number,pump_price,invoice_pic,type)';
  }

  static String getStationDetails(int stationId, String date) {
    print(date);
    return 'station?order=id.desc&id=eq.$stationId&select=id,name,wholesale,inter_transfer,location_feature,image_upload,longitude,latitude,radius,compress_image_quality,density_temperature_feature,bank_prefix,bank(bank_id,name),credit_customer(customer_id(name,id),customer_id,active_state),station_product(product_id(name,product_id)),nozzle(id,name,product_id,active_state,tank_group_id),station_warehouse(warehouse(id,name)),expense_supervisor(expense_auth_id,name,station_expense_auth(active_state)),station_report(id,date),station_expense_category(expense_category(id,name)),tank_group(id,name,product_id,tank(id,name,tank_group_id,active_state)),nozzle_meter_reset(effective_date,opening_meter,nozzle_id(id,product_id)),tank_dip_reset(effective_date,opening_dip,tank_id(id,tank_group_id(product_id)))&nozzle_meter_reset.effective_date=eq.$date&tank_dip_reset.effective_date=eq.$date';
  }

  static String getDischarges(String date, int productId, int stationId) {
    return 'discharge_main?order=id.desc&effective_date=eq.$date&state=eq.done&product_id=eq.$productId&station_id=eq.$stationId&select=id,new_discharge,invoice_number,type,truck_number,delivery_shortage,actual_volume,delivery_overage,tank_discharge(tank_id,quantity)';
  }

  static String getStationReportForDate(int stationId, String date) {
    return 'stock_station_report?order=id.desc&station_id=eq.$stationId&date=eq.$date&select=id,station_id,date,officer_id,created_time,stock_bank_deposit(deposited_by,amount,bank_id,is_cheque,cheque_bank,cheque_number,transaction_ref),stock_loss(id,tank_id,date,dehydrated_closing_dips,meter_sales,inventory_at_date_liters,inventory_valuation_liters,inventory_at_date_ghc,inventory_valuation_ghc,date),stock_product_report(product_id,id,state,stock_report_line(opening_meter,closing_meter,rtt,meter_sales,comment,nozzle_id,nozzle_image,time_taken),stock_stock(closing_dip,opening_dip,tank_id,water_level,closing_dip_measured),stock_credit_sale(unit_price,customer_id,wholesale,quantity,tank_id),stock_cash_sale(unit_price,quantity),stock_genset(unit_price,quantity,type),discharge(id,new_discharge,truck_number,invoice_number,type,delivery_shortage,delivery_overage,discharge_main_id(tank_discharge(tank_id,quantity))),stock_station_transfer(quantity,type,warehouse_id,vehicle_number,transporter,cost_unit_price,invoice_number,tank_id),stock_goods_in_transit(id,new_discharge,invoice_number,truck_number,pump_price,invoice_pic,type)';
  }

  static String getDensityTemperature(String date, int stationId) {
    return 'daily_temperature_density?station_id=eq.$stationId&date_recorded=eq.$date&select=date_recorded,temperature_density_line(density,temperature,period,dip,tank_id)';
  }

  static String getCashCount(String date, int stationId) {
    return 'stock_cash_count?order=id.desc&date=eq.$date&station_id=eq.$stationId&select=id,description,unit,quantity,type,date,is_coin';
  }

  static String getUnbankedSales(String date, int stationId) {
    return 'stock_unbanked_sale?order=id.desc&date=eq.$date&station_id=eq.$stationId&select=id,amount,sale_date';
  }

  static String getSignedDocument(String date, int stationId) {
    return 'stock_signed_document?order=id.desc&date=eq.$date&station_id=eq.$stationId&select=id,picture';
  }

  static String getTankStock(int tankId) {
    return 'tank_stock?order=id.desc&tank_id=eq.$tankId&limit=1&select=stock_quantity,stock_value_valuation,stock_quantity_valuation,stock_value';
  }
}
