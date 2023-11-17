import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/constants/colors.dart';
import 'package:qg_stock_take_app/constants/size_config.dart';
import 'package:qg_stock_take_app/screens/select_station.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              vertical: 0, horizontal: MediaQuery.sizeOf(context).width * 0.1),
          child: Column(
            children: [
              TextField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(
                      fontSize: getProportionateScreenHeight(15),
                      color: Colors.black38,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              TextField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                    hintText: 'Station Code',
                    hintStyle: TextStyle(
                      fontSize: getProportionateScreenHeight(15),
                      color: Colors.black38,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none),
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorYellow,
                  fixedSize: Size(MediaQuery.sizeOf(context).width,
                      getProportionateScreenHeight(40)),
                ),
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: getProportionateScreenHeight(18),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SelectStation()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
