import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';

class DrawerNavigationWidget extends StatelessWidget {
  
  final String text;
  
  DrawerNavigationWidget({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:30.0,right:170.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.home,
            color: kActiveColor,
            size: 35.0,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 20.0,
              color: kInActiveColor,
            ),
          ),
        ],
      ),
    );
  }
}
