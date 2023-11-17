import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/screens/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'PFBeauSansPro'),
      home: const LoginScreen(),
    );
  }
}
