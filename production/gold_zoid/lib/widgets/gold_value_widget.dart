import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';



class GoldValueWidget extends StatelessWidget {
  
  final String gold_in_grams;
  final String gold_value;


  GoldValueWidget({@required this.gold_in_grams,@required this.gold_value});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      'Your gold',
                      style: kGoldValueTextTextStyle,
                    ),
                    RichText(
                      text: TextSpan(
                        text: gold_in_grams,
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
                      'Your gold value',
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
                            text: gold_value,
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
    );
  }
}
