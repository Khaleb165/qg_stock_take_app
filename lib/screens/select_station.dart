import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qg_stock_take_app/constants/colors.dart';
import 'package:qg_stock_take_app/constants/size_config.dart';
import 'package:qg_stock_take_app/providers/login_provider.dart';
import 'package:qg_stock_take_app/screens/stock_take_details/stock_take.dart';

class SelectStation extends StatefulWidget {
  const SelectStation({super.key});

  @override
  State<SelectStation> createState() => _SelectStationState();
}

class _SelectStationState extends State<SelectStation> {
  bool _isInitialized = false;

  @override
  void initState() {
    if (!_isInitialized) {
      context.read<LoginProvider>().getStations();
      _isInitialized = true;
      debugPrint('is initialized $_isInitialized');
    }

    super.initState();
  }

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
                // TODO: Change the text to the name of the team
                'Team 1',
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(18),
                  color: primaryColor,
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(15)),
              Flexible(
                flex: 1,
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 4,
                  ),
                  itemCount: context.watch<LoginProvider>().stations.length,
                  itemBuilder: (context, index) {
                    final stations = context.watch<LoginProvider>().stations;
                    return MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StockTakeScreen(
                                      index: index,
                                    )));
                      },
                      color: colorGrey,
                      elevation: 0,
                      child: Text(
                        stations[index].name ?? '',
                        style: TextStyle(color: colorWhite),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
