import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/constants/colors.dart';
import 'package:qg_stock_take_app/constants/size_config.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: getProportionateScreenHeight(60),
        backgroundColor: primaryColor,
        title: Text(
          'Kasoa Akweley F/S 2.0v',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: colorWhite,
          ),
        ),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Text(
                'Stock for: Dec 13,2019',
                style: TextStyle(
                    fontSize: getProportionateScreenHeight(19),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              buildCard(
                'Power Diesel',
                0.00,
                0.00,
                0.00,
                0.00,
                0.00,
                0.00,
                () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton buildCard(
    String title,
    double grandTotal,
    double credit,
    double creditSale,
    double cashSale,
    double gensetSale,
    double fuelCoupon,
    // Color color,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.only(top: 20, left: 10, bottom: 20),
        backgroundColor: colorDeepBlue1,
      ),
      child: Column(
        // mainAxisAlignment: mainSpaceBetween,
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
}
