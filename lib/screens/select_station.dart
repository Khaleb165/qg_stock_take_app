import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qg_stock_take_app/constants/colors.dart';
import 'package:qg_stock_take_app/constants/size_config.dart';
import 'package:qg_stock_take_app/offline/prefs_manager.dart';
import 'package:qg_stock_take_app/providers/login_provider.dart';
import 'package:qg_stock_take_app/screens/stock_take_details/stock_take.dart';

class SelectStation extends StatefulWidget {
  const SelectStation({super.key});

  @override
  State<SelectStation> createState() => _SelectStationState();
}

class _SelectStationState extends State<SelectStation> {
  bool _isLoading = false;
  bool _isInitialized = false;

  // load stations from the server
  Future<void> _loadStations() async {
    final stations = context.read<LoginProvider>().stations;
    setState(() {
      _isLoading = true;
    });
    try {
      if (stations.isEmpty) {
        await context.read<LoginProvider>().getStations();
      } else {
        debugPrint('stations already loaded');
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$error'),
          backgroundColor: primaryColor,
        ),
      );
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    if (!_isInitialized) {
      _loadStations();
      _isInitialized = true;
      debugPrint('is initialized $_isInitialized');
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _loadStations,
        color: primaryColor,
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              )
            : SafeArea(
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
                        PrefsManager.getTeamName(),
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
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 4,
                          ),
                          itemCount:
                              context.watch<LoginProvider>().stations.length,
                          itemBuilder: (context, index) {
                            final stations =
                                context.watch<LoginProvider>().stations[index];
                            return MaterialButton(
                              onPressed: () async {
                                await PrefsManager.setStationId(
                                    stations.id ?? 0);
                                await PrefsManager.setStationName(
                                    stations.name ?? '');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const StockTakeScreen()));
                              },
                              color: colorGrey,
                              elevation: 0,
                              child: Text(
                                stations.name ?? '',
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
      ),
    );
  }
}
