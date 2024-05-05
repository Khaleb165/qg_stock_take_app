import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qg_stock_take_app/network/token_manager.dart';
import 'package:qg_stock_take_app/offline/prefs_manager.dart';
import 'package:qg_stock_take_app/screens/login.dart';
import 'package:qg_stock_take_app/screens/select_station.dart';
import 'package:qg_stock_take_app/util/database_util.dart';

import 'constants/colors.dart';
import 'providers/login_provider.dart';
import 'providers/reports_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseUtil().initDatabase();
  await PrefsManager().init();
  await TokenManager(
          PrefsManager.getStationPhone(), PrefsManager.getStationCode())
      .initialize();

  runApp(const StockTakeApp());
}

class StockTakeApp extends StatelessWidget {
  const StockTakeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => ReportsProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            fontFamily: 'PFBeauSansPro',
            useMaterial3: false,
            tabBarTheme: TabBarTheme(
              labelColor: colorYellow,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
              labelPadding: const EdgeInsets.all(15),
              indicatorColor: colorYellow,
              unselectedLabelColor: colorWhite,
            )),
        home: PrefsManager.isLogIn()
            ? const SelectStation()
            : const LoginScreen(),
      ),
    );
  }
}
