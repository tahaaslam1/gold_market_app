import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/views/widgets/drawer/drawer_navigation_widget.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kTitleIconColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: kDrawerHeight,
                color: kTitleIconColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'GOLD',
                              style: TextStyle(
                                letterSpacing: -1.0,
                                color: kPrimaryColor,
                                fontSize: 35.0,
                                fontFamily: 'Avenir',
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'ZO',
                                  style: TextStyle(
                                    letterSpacing: -1.0,
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 35.0,
                                  ),
                                ),
                                TextSpan(
                                  text: 'ID',
                                  style: TextStyle(
                                    letterSpacing: -1.0,
                                    color: kPrimaryColor,
                                    fontSize: 35.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'explore your market',
                            style: kSideTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              kGreyDivider,
              SizedBox(height: 20),
              DrawerNavigationWidget(
                text: 'Home',
              ),
              SizedBox(height: 20),
              kGreyDivider,
              SizedBox(height: 20),
              DrawerNavigationWidget(
                text: 'My Inventory',
              ),
              SizedBox(height: 20),
              kGreyDivider,
              SizedBox(height: 20),
              DrawerNavigationWidget(
                text: 'My Account',
              ),
              SizedBox(height: 20),
              kGreyDivider,
              SizedBox(height: 20),
              DrawerNavigationWidget(
                text: 'Buy / Sell',
              ),
              SizedBox(height: 20),
              kGreyDivider,
              SizedBox(height: 20),
              DrawerNavigationWidget(
                text: 'F.a.q & Helps',
              ),
              SizedBox(height: 20),
              kGreyDivider,
            ],
          ),
        ),
      ),
    );
  }
}
