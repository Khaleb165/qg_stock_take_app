import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qg_stock_take_app/constants/colors.dart';
import 'package:qg_stock_take_app/constants/keyboard.dart';
import 'package:qg_stock_take_app/constants/size_config.dart';
import 'package:qg_stock_take_app/network/token_manager.dart';
import 'package:qg_stock_take_app/providers/login_provider.dart';
import 'package:qg_stock_take_app/screens/select_station.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController stationController = TextEditingController();
  bool isLoading = false;

  // login user
  Future<void> loginUser() async {
    final phoneNumber = phoneController.text.trim();
    final stationCode = stationController.text.trim();

    TokenManager tokenManager = TokenManager(phoneNumber, stationCode);
    setState(() {
      isLoading = true;
    });

    if (phoneNumber.isEmpty || stationCode.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please fill all fields'),
          backgroundColor: colorYellow,
        ),
      );
      setState(() {
        isLoading = false;
      });
      return;
    }

    try {
      await context.read<LoginProvider>().login(phoneNumber, stationCode);
      await tokenManager.initialize();
      debugPrint('Token generated: ${tokenManager.token}');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login successful'),
          backgroundColor: Colors.green,
        ),
      );
      setState(() {
        isLoading = false;
      });
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SelectStation()));
    } catch (e) {
      debugPrint('the error is ----- $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('An error occurred'),
          backgroundColor: colorYellow,
        ),
      );
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    phoneController.dispose();
    stationController.dispose();
    super.dispose();
  }

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
                controller: phoneController,
                maxLength: 10,
                keyboardType: TextInputType.phone,
                onTapOutside: (event) => hideKeyboard(context),
                decoration: InputDecoration(
                    counterText: "",
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
                controller: stationController,
                maxLength: 4,
                keyboardType: TextInputType.phone,
                onTapOutside: (event) => hideKeyboard(context),
                decoration: InputDecoration(
                    counterText: '',
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
                onPressed: loginUser,
                child: isLoading
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                      )
                    : Text(
                        'LOGIN',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: getProportionateScreenHeight(18),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
