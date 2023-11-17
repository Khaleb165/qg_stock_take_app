import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/constants/colors.dart';
import 'package:qg_stock_take_app/constants/size_config.dart';
import 'package:qg_stock_take_app/screens/stock_take_details/sales.dart';

class StockTakeScreen extends StatelessWidget {
  const StockTakeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: getProportionateScreenHeight(60),
        automaticallyImplyLeading: false,
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
            children: [
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              buildCard(
                'Sales',
                primaryColor,
                () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SalesScreen()));
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              buildCard(
                'Cash',
                primaryColor2,
                () {},
              ),
              SizedBox(height: getProportionateScreenHeight(15)),
              buildCard(
                'Sales Summary',
                primaryColor3,
                () {},
              ),
              SizedBox(height: getProportionateScreenHeight(15)),
              buildCard(
                'Signed Document',
                primaryColor3,
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
    Color color,
    VoidCallback onPressed,
  ) {
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
