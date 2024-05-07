import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qg_stock_take_app/constants/colors.dart';
import 'package:qg_stock_take_app/constants/size_config.dart';
import 'package:qg_stock_take_app/providers/login_provider.dart';
import 'package:qg_stock_take_app/providers/reports_provider.dart';
import 'package:qg_stock_take_app/screens/login.dart';
import 'package:qg_stock_take_app/screens/stock_take_details/cash/cash.dart';
import 'package:qg_stock_take_app/screens/stock_take_details/sales/sales.dart';
import 'package:qg_stock_take_app/screens/stock_take_details/sales_summary/sales_summary.dart';
import 'package:qg_stock_take_app/screens/stock_take_details/signed_document/signed_document.dart';

import '../../offline/prefs_manager.dart';

class StockTakeScreen extends StatefulWidget {
  const StockTakeScreen({super.key});

  @override
  State<StockTakeScreen> createState() => _StockTakeScreenState();
}

class _StockTakeScreenState extends State<StockTakeScreen> {
// get staion reports
  Future<void> getReports() async {
    try {
      await context.read<ReportsProvider>().getReports();
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$error'),
          backgroundColor: primaryColor,
        ),
      );
    }
  }

  @override
  void initState() {
    getReports();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//     final stations = context.read<LoginProvider>().stations[widget.index];
//     String stationName = stations.name ?? '';
//     int stationId = stations.id ?? 0;
// // //  set the station id and name to the prefs
// //     context.read<ReportsProvider>().setStationId(stationId);
// //     context.read<ReportsProvider>().setStationName(stationName);
//     PrefsManager.setStationId(stationId);
//     PrefsManager.setStationName(stationName);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        title: Text('${PrefsManager.getStationName()} 1.0v'),
        actions: [
          PopupMenuButton(
            color: Colors.black87,
            itemBuilder: (context) => [
              PopupMenuItem(
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Sync',
                    style: TextStyle(color: colorWhite),
                  ),
                ),
              ),
              PopupMenuItem(
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Check for updates',
                    style: TextStyle(color: colorWhite),
                  ),
                ),
              ),
              PopupMenuItem(
                child: GestureDetector(
                  onTap: () {
                    context.read<LoginProvider>().logout();
                    debugPrint('logged out');
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                        (route) => false);
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(color: colorWhite),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),

              // card for the sales
              buildCard(
                title: 'Sales',
                color: primaryColor,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SalesScreen()));
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),

              // card for cash
              buildCard(
                title: 'Cash',
                color: primaryColor2,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CashPage()));
                },
              ),
              SizedBox(height: getProportionateScreenHeight(15)),

              // card for sales summary
              buildCard(
                title: 'Sales Summary',
                color: primaryColor3,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SalesSummary()));
                },
              ),
              SizedBox(height: getProportionateScreenHeight(15)),

              // card for signed document
              buildCard(
                title: 'Signed Document',
                color: primaryColor3,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignedDocument()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

// a method and design template for the cards used in the stock take page
  ElevatedButton buildCard(
      {required String title,
      required Color color,
      required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.only(top: 20, left: 10),
        backgroundColor: color,
        fixedSize: Size(
          double.maxFinite,
          getProportionateScreenHeight(150),
        ),
      ),
      child: Column(
        mainAxisAlignment: mainSpaceBetween,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Icon(
              Icons.help_outline,
              color: primaryDarkColor,
            ),
          ),
          Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: getProportionateScreenHeight(18),
                color: colorWhite,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(),
          const SizedBox()
        ],
      ),
    );
  }
}
