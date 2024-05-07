import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/constants/colors.dart';
import 'package:qg_stock_take_app/constants/size_config.dart';
import 'package:qg_stock_take_app/offline/prefs_manager.dart';
import 'package:qg_stock_take_app/screens/stock_take_details/sales/damsa.dart';
import 'package:qg_stock_take_app/screens/stock_take_details/sales/nozzle_reports.dart';
import 'package:qg_stock_take_app/screens/stock_take_details/sales/stock_loss/stock_loss.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('${PrefsManager.getStationName()} 1.0v'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_outlined,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: crossCenter,
          children: [
            SizedBox(height: getProportionateScreenHeight(10)),
            Text(
              'Stock for: Dec 13,2019',
              style: TextStyle(
                  fontSize: getProportionateScreenHeight(19),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: getProportionateScreenHeight(15)),

            // card for power diesel
            buildSaleCard(
              title: 'Power Diesel',
              grandTotal: 0.00,
              credit: 0.00,
              creditSale: 0.00,
              cashSale: 0.00,
              gensetSale: 0.00,
              fuelCoupon: 0.00,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NozzlesScreen(
                              title: 'Power Diesel',
                            )));
              },
            ),
            SizedBox(height: getProportionateScreenHeight(15)),

            // DAMSA power diesel card
            buildDamsaCard(
              title: 'DAMSA(Power Diesel)',
              tank: 'DT1',
              variation: 0,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const DAMSA(title: 'Power Diesel')));
              },
            ),
            SizedBox(height: getProportionateScreenHeight(15)),

            // a card for power super
            buildSaleCard(
              title: 'Power Super',
              grandTotal: 0.00,
              credit: 0.00,
              creditSale: 0.00,
              cashSale: 0.00,
              gensetSale: 0.00,
              fuelCoupon: 0.00,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NozzlesScreen(
                              title: 'Power Super',
                            )));
              },
            ),
            SizedBox(height: getProportionateScreenHeight(15)),

            // DAMSA power super card
            buildDamsaCard(
              title: 'DAMSA(Power Super)',
              tank: 'ST1',
              variation: 0,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const DAMSA(title: 'Power Super')));
              },
            ),
            SizedBox(height: getProportionateScreenHeight(15)),

            // card for stock loss
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const StockLoss()));
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 20, left: 10, bottom: 20),
                fixedSize:
                    Size(double.maxFinite, getProportionateScreenHeight(140)),
                backgroundColor: colorLightBlue2,
              ),
              child: Column(
                mainAxisAlignment: mainCenter,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Icon(
                      Icons.help_outline,
                      color: primaryDarkColor,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Stock Loss',
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(17),
                      color: colorWhite,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

// method and card template for power cards
  ElevatedButton buildSaleCard(
      {required String title,
      required double grandTotal,
      required double credit,
      required double creditSale,
      required double cashSale,
      required double gensetSale,
      required double fuelCoupon,
      // Color color,
      required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.only(top: 20, left: 10, bottom: 20),
        backgroundColor: colorDeepBlue1,
      ),
      child: Column(
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
                fontSize: getProportionateScreenHeight(17),
                color: colorWhite,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            'Grand Total: $grandTotal',
          ),
          Text(
            'Credit Sale: $creditSale',
          ),
          Text(
            'Cash Sale: $cashSale',
          ),
          Text(
            'Genset Sale: $gensetSale',
          ),
          Text('Fuel Coupon: $fuelCoupon')
        ],
      ),
    );
  }

// method and template for DAMSA cards
  ElevatedButton buildDamsaCard({
    required String title,
    required String tank,
    required double variation,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.only(top: 20, left: 10, bottom: 20),
        backgroundColor: colorDeepBlue2,
      ),
      child: Column(
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
                fontSize: getProportionateScreenHeight(17),
                color: colorWhite,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text('Variation for $tank: $variation'),
          Text('Variation for $tank: $variation'),
          SizedBox(height: getProportionateScreenHeight(35)),
        ],
      ),
    );
  }
}
