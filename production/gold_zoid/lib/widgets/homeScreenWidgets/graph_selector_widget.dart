import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';

class GraphSelectorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 35.0,
          width: 75.0,
          decoration: BoxDecoration(
            color: kActiveColor,
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
          child: Center(
            child: Text(
              '1D',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
        Container(
          height: 35.0,
          width: 75.0,
          decoration: BoxDecoration(
            color: kInActiveColor,
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
          child: Center(
            child: Text(
              '1W',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
        Container(
          height: 35.0,
          width: 75.0,
          decoration: BoxDecoration(
            color: kInActiveColor
,            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
          child: Center(
            child: Text(
              '1M',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
        Container(
          height: 35.0,
          width: 75.0,
          decoration: BoxDecoration(
            color: kInActiveColor,
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
          child: Center(
            child: Text(
              '1Y',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
      ],
    );
  }
}
