import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';

class DrawerNavigationWidget extends StatelessWidget {
  final String text;

  DrawerNavigationWidget({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Icon(
            Icons.home,
            color: kActiveColor,
            size: 35.0,
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20.0,
              color: kInActiveColor,
            ),
          ),
        ),
      ],
    );
  }
}
