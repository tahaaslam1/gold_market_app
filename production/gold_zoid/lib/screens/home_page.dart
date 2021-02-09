import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/titles/home_page_title.dart';
import 'package:gold_zoid/widgets/gold_value_widget.dart';

// ignore: camel_case_types
class Home_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          HomePageTitle(
            side_text: 'explore your market',
          ),
          SizedBox(
              height: 5.0), // dhek lou abhi agar bachti he jagah tu bhara dena
          GoldValueWidget(
            gold_in_grams: 450.toString(),
            gold_value: 17000.00.toString(),
          ),
          Container(
            height: 260.0,
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
                SizedBox(height: 10.0 ,),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 211.0,
                        width: 150.0,
                        padding: EdgeInsets.only(left: 25.0),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2.0,
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 10,
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Container(
                          height: 211.0,
                          width: 150.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                            BoxShadow(
                              spreadRadius: 2.0,
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 10,
                            ),
                          ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 5.0,),
                Divider(
                  color: kPrimaryColor,
                  thickness: 1.0,
                  indent: 50.0,
                  endIndent: 50.0,
                ),
              ],
            ),
          ),
          Container(color: Colors.blue, height: 240.0),
        ],
      ),
    ));
  }
}
