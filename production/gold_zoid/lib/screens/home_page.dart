import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/titles/home_page_title.dart';
import 'package:gold_zoid/homeScreenWidgets/current_metal_prices.dart';
import 'package:gold_zoid/homeScreenWidgets/gold_value_widget.dart';
import 'package:gold_zoid/homeScreenWidgets/graph_selector_widget.dart';

// ignore: camel_case_types
class Home_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: SafeArea(
          child: Column(
            children: [
              HomePageTitle(
                side_text: 'explore your market',
              ),
              SizedBox(
                height: 5.0, // dhek lou abhi agar bachti he jagah tu bhara dena
              ),
              GoldValueWidget(
                gold_in_grams: 450.toString(),
                gold_value: 17000.00.toString(),
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
                        style: TextStyle(color: kPrimaryTextColor, fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CurrentMetalPriceWidget(
                            metal_image: 'assets/images/gold_icon.png',
                            metal_name: 'Gold',
                            high_quality_metal_grade: '24K',
                            high_quality_metal_price: '590',
                            avg_quality_metal_grade: '22K',
                            avg_quality_metal_price: '500',
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          CurrentMetalPriceWidget(
                            metal_image: 'assets/images/silver_icon.png',
                            metal_name: 'Silver',
                            high_quality_metal_grade: '999',
                            high_quality_metal_price: '590',
                            avg_quality_metal_grade: '960',
                            avg_quality_metal_price: '500',
                          ),
                        ],
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
                        style: TextStyle(color: kPrimaryTextColor, fontSize: 25),
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
                              color: Colors.black,
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
