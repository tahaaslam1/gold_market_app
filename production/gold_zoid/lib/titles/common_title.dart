import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/commonWidgets/drawer_button.dart';


class CommonTitle extends StatelessWidget {
  final String mainTitleText;
  final String sideText;
  final Widget icon;
  CommonTitle(
      {@required this.mainTitleText,
      @required this.sideText,
      @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kDrawerHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // Icon(
                    icon, //   Icons.iconType,
                    //   size: 35.0,
                    // ),
                    Text(
                      mainTitleText,
                      style: TextStyle(
                        fontSize: 35.0,
                        letterSpacing: -1.0,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    sideText,
                    style: kSideTextStyle,
                  ),
                ),
              ],
            ),
          ),
          DrawerButton(),
        ],
      ),
    );
  }
}
