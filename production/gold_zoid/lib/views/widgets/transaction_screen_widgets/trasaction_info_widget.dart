import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';

class TransactionInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Buy/Sell',
                    style:
                        TextStyle(color: kSecondaryTextColor, fontSize: 12.0),
                  ),
                ],
              ),
              kBlackDivider2,
              RichText(
                // Quantity of gold item
                text: TextSpan(
                  text: 'Date/Time : ',
                  style: TextStyle(
                    color: kPrimaryTextColor,
                    fontSize: 12.0,
                    fontFamily: 'Avenir',
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '6/12/21.12:00',
                      style: TextStyle(
                        color: kSecondaryTextColor,
                        fontSize: 12.0,
                        fontFamily: 'Avenir',
                      ),
                    ),
                  ],
                ),
              ),
              kBlackDivider2,
              RichText(
                // Karrot of gold item
                text: TextSpan(
                  text: 'profit: ',
                  style: TextStyle(
                    color: kPrimaryTextColor,
                    fontSize: 12.0,
                    fontFamily: 'Avenir',
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\$',
                      style: TextStyle(
                        color: kSecondaryTextColor,
                        fontSize: 12.0,
                        fontFamily: 'Avenir',
                      ),
                    ),
                    TextSpan(
                      text: '245',
                      style: TextStyle(
                        color: kSecondaryTextColor,
                        fontSize: 12.0,
                        fontFamily: 'Avenir',
                      ),
                    ),
                  ],
                ),
              ),
              kBlackDivider2,
              // RichText(
              //   // Price of gold item
              //   text: TextSpan(
              //     text: '\$ ',
              //     style: TextStyle(
              //       color: kPrimaryTextColor,
              //       fontSize: 12.0,
              //       fontFamily: 'Avenir',
              //     ),
              //     children: <TextSpan>[
              //       TextSpan(
              //         text: '2400',
              //         style: TextStyle(
              //           color: kSecondaryTextColor,
              //           fontSize: 12.0,
              //           fontFamily: 'Avenir',
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
          height: 80.0,
          //width: 115,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                spreadRadius: 1.0,
                color: Colors.grey.withOpacity(1.0),
                blurRadius: 5,
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      );
  }
}