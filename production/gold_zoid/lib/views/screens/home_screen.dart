import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/controllers/inventory_item_controller.dart';
import 'package:gold_zoid/controllers/user_controller.dart';
import 'package:gold_zoid/controllers/user_inventory_controller.dart';
import 'package:gold_zoid/models/item_model.dart';
import 'package:gold_zoid/models/user_model.dart';
import 'package:gold_zoid/views/titles/home_page_title.dart';

import 'package:gold_zoid/views/widgets/homeScreenWidgets/current_metal_prices.dart';
import 'package:gold_zoid/views/widgets/homeScreenWidgets/gold_value_widget.dart';
import 'package:gold_zoid/views/widgets/homeScreenWidgets/graph_selector_widget.dart';
import 'package:provider/provider.dart';
import 'package:gold_zoid/controllers/marketController.dart';
import 'package:gold_zoid/models/material_model.dart' as material;
import 'package:gold_zoid/models/market_model.dart';
import 'package:gold_zoid/views/widgets/commonWidgets/drawer_button.dart';
import 'package:gold_zoid/views/widgets/drawer/custom_drawer.dart';
import 'package:gold_zoid/controllers/user_login_signup_controller.dart';
import 'package:gold_zoid/controllers/user_controller.dart';

class Home_Page extends StatefulWidget {
  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final MarketController _marketController = MarketController();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var _userInfoStatus;

  @override
  void initState() {
    super.initState();
    setUser().then((value) => setState(() {}));
  }

  Future setUser() async {
    await Provider.of<UserController>(context, listen: false).getAllUserDetails(
        userEmailId:
            Provider.of<UserLoginSignUpController>(context, listen: false)
                .getLoggedInUser
                .emailId
                .toString());

    await Provider.of<UserInventoryController>(context, listen: false)
        .getUserInventory(
      userId: Provider.of<UserController>(context, listen: false)
          .getLoggedInUser
          .userId
          .toString(),
    );

    _userInfoStatus = 'gotten';
  }

  @override
  Widget build(BuildContext context) {
    if (_userInfoStatus == null) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              HomePageTitle(side_text: 'explore your market'),
              Expanded(
                  child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: kPrimaryColor,
                ),
              )),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      endDrawer: CustomDrawer(
        onTap: () => Navigator.pop(context),
      ),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              HomePageTitle(
                onTap: () => _scaffoldKey.currentState.openEndDrawer(),
                side_text: 'explore your market',
              ),
              SizedBox(
                height: 5.0, // dhek lou abhi agar bachti he jagah tu bhara dena
              ),
              GoldValueWidget(
                gold_in_grams:
                    context.watch<UserInventoryController>().getLoggedInUserInventory.totalGold.toStringAsFixed(2),
                gold_value:
                    '${context.watch<UserInventoryController>().getLoggedInUserInventory.totalGoldValue.toStringAsFixed(2)}',
              ),
              kYellowDivider,
              Container(
                height: 255.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        'Current market price',
                        style:
                            TextStyle(color: kPrimaryTextColor, fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                      child: FutureBuilder<List<Market>>(
                        future: _marketController.fetchMaterialPrice(),
                        builder: (context, snapshot) {
                          var markets = snapshot.data;
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircularProgressIndicator(
                                    backgroundColor: kPrimaryColor,
                                  ),
                                  CircularProgressIndicator(
                                    backgroundColor: kPrimaryColor,
                                  ),
                                ],
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                'Unable to Fetch data!\n    Please try again',
                                style: TextStyle(
                                  color: Colors.red[400],
                                  fontSize: 20.0,
                                ),
                              ),
                            );
                          } else
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CurrentMetalPriceWidget(
                                  metal_image: 'assets/images/gold_icon.png',
                                  metal_name: 'Gold',
                                  high_quality_metal_grade: '24K',
                                  high_quality_metal_price:
                                      '${_marketController.getPriceFromMarket('gold', markets.last, 24).toStringAsPrecision(4)}',
                                  avg_quality_metal_grade: '22K',
                                  avg_quality_metal_price:
                                      '${_marketController.getPriceFromMarket('gold', markets.last, 22).toStringAsPrecision(4)}',
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                CurrentMetalPriceWidget(
                                  metal_image: 'assets/images/silver_icon.png',
                                  metal_name: 'Silver',
                                  high_quality_metal_grade: '999',
                                  high_quality_metal_price:
                                      '${_marketController.getPriceFromMarket('silver', markets.last, 999).toStringAsPrecision(2)}',
                                  avg_quality_metal_grade: '960',
                                  avg_quality_metal_price:
                                      '${_marketController.getPriceFromMarket('silver', markets.last, 960).toStringAsPrecision(2)}',
                                ),
                              ],
                            );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              kYellowDivider,
              Container(
                height: 235.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        'Your sales graph',
                        style:
                            TextStyle(color: kPrimaryTextColor, fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Center(child: Text('Under Contruction')),
                              color: Colors.white,
                              height: 200.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    GraphSelectorWidget(),
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
