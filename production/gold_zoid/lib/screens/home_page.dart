import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/titles/home_page_title.dart';

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
          Container(
            //color: Colors.grey,
            height: 100.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Your Gold',
                            style: kGoldValueTextTextStyle,
                          ),
                          RichText(
                            text: TextSpan(
                              text: '450',
                              style: TextStyle(
                                color: kSecondaryTextColor,
                                fontSize: 28.0,
                                fontFamily: 'Avenir',
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'gr',
                                  style: TextStyle(
                                    color: kPrimaryTextColor,
                                    fontSize: 28.0,
                                    fontFamily: 'Avenir-Light',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Your Gold Value',
                            style: kGoldValueTextTextStyle,
                          ),
                          RichText(
                            text: TextSpan(
                              text: r'$',
                              style: TextStyle(
                                color: kPrimaryTextColor,
                                fontSize: 28.0,
                                fontFamily: 'Avenir-Light',
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '17000.00',
                                  style: TextStyle(
                                    color: kSecondaryTextColor,
                                    fontSize: 28.0,
                                    fontFamily: 'Avenir',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: kPrimaryColor,
                  thickness: 1.0,
                  indent: 50.0,
                  endIndent: 50.0,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
