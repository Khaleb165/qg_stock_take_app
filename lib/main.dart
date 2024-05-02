import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qg_stock_take_app/screens/login.dart';
import 'package:qg_stock_take_app/util/database_util.dart';

import 'constants/colors.dart';
import 'providers/login_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseUtil().initDatabase();

  runApp(const StockTakeApp());
}

class StockTakeApp extends StatelessWidget {
  const StockTakeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
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
        home: const LoginScreen(),
      ),
    );
  }
}
