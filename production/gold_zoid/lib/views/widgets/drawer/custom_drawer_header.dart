import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';

class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
                'navigate through app',
                style: kSideTextStyle,
              ),
            ],
          ),
          InkWell(
            child: Icon(
              Icons.close,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}
