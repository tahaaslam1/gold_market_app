import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';

class Residual extends StatelessWidget {
  final String residualName;
  final int residualValue;
  Residual({@required this.residualName, this.residualValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            residualName,
            style: TextStyle(
              fontSize: 15.0,
              color: kPrimaryTextColor,
            ),
          ),
        
          Container(
            height: 15.0,
            width: 50.0,
            child: TextField(
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                color: kSecondaryTextColor,
              ),
              cursorColor: kSecondaryTextColor,
              cursorHeight: 15.0,
              decoration: InputDecoration(
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: kPrimaryTextColor,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
