import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/constants/colors.dart';
import 'package:qg_stock_take_app/constants/size_config.dart';
import 'package:qg_stock_take_app/screens/stock_take_details/stock_take.dart';

class SelectStation extends StatelessWidget {
  const SelectStation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: crossCenter,
            children: [
              SizedBox(height: getProportionateScreenHeight(8)),
              Text(
                'Select Station',
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(20),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Text(
                'Team 1',
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(18),
                  color: primaryColor,
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(15)),
              Flexible(
                flex: 1,
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 4,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StockTakeScreen()));
                      },
                      color: colorGrey,
                      elevation: 0,
                      child: Text('Odoo', style: TextStyle(color: colorWhite)),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: colorGrey,
                      elevation: 0,
                      child: Text('Odoo', style: TextStyle(color: colorWhite)),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: colorGrey,
                      elevation: 0,
                      child: Text('Odoo', style: TextStyle(color: colorWhite)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
