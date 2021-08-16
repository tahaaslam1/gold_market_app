import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';

class TradeOption extends StatelessWidget {
  const TradeOption({ @required this.tradeOption,@required this.color});
  
  final String tradeOption;
  final Color color; 
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('buy or sell trade option');
      },
      child: Container(
        height: 40.0,
        width: 80.0,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: 1.0,
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5,
            ),
          ],
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
        child: Center(
          child: Text(
            tradeOption,
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
        ),
      ),
    );
  }
}
