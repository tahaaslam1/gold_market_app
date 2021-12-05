import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';

class ItemInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Column( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/gold_icon2.png',
                    height: 25.0,
                    width: 25.0,
                  ),
                  Text(
                    '40gr',
                    style: TextStyle(color: kSecondaryTextColor, fontSize: 12.0),
                  ),
                ],
              ),
              width: 60.0,
              height: 55.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
                border: Border.all(color: kInventoryBoxColor),
              ),
            ),
            kBlackDivider, 
            RichText(                        // Quantity of gold item
              text: TextSpan(
                text: 'Qty : ',
                style: TextStyle(
                  color: kPrimaryTextColor,
                  fontSize: 12.0,
                  fontFamily: 'Avenir',
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '2',
                    style: TextStyle(
                      color: kSecondaryTextColor,
                      fontSize: 12.0,
                      fontFamily: 'Avenir',
                    ),
                  ),
                ],
              ),
            ),
            kBlackDivider,
            RichText(                        // Karrot of gold item
              text: TextSpan(
                text: '22 ',
                style: TextStyle(
                  color: kPrimaryTextColor,
                  fontSize: 12.0,
                  fontFamily: 'Avenir',
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'K',
                    style: TextStyle(
                      color: kSecondaryTextColor,
                      fontSize: 12.0,
                      fontFamily: 'Avenir',
                    ),
                  ),
                ],
              ),
            ),
            kBlackDivider,
            RichText(                        // Price of gold item
              text: TextSpan(
                text: '\$ ',
                style: TextStyle(
                  color: kPrimaryTextColor,
                  fontSize: 12.0,
                  fontFamily: 'Avenir',
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '75',
                    style: TextStyle(
                      color: kSecondaryTextColor,
                      fontSize: 12.0,
                      fontFamily: 'Avenir',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        height: 170.0,
        width: 115,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: 1.0,
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
