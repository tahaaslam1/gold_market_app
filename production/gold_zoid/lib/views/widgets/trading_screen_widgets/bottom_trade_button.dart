import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';


class BottomTradeButton extends StatelessWidget {
  const BottomTradeButton({@required this.finalTradeOption});
  final String finalTradeOption;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        child: Center(
          child: Text(
            finalTradeOption,
            style: TextStyle(
              letterSpacing: 1.5,
              fontSize: 20.0,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        height: 58.0,
      ),
    );
  }
}
