import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/views/widgets/commonWidgets/drawer_button.dart';

class HomePageTitle extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String side_text;
  final Function onTap; 
  // ignore: non_constant_identifier_names
  const HomePageTitle({@required this.side_text,this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kDrawerHeight,
      color: Colors.white,
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
                          color: Color(0xFF0000000),
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
                  side_text,
                  style: kSideTextStyle,
                ),
              ],
            ),
          ),
          DrawerButton(
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
