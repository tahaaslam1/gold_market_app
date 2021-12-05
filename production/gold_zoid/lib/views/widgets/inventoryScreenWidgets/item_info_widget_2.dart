import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';

class ItemInfoWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onLongPress: () {
          print('item delete krne ki bottom sheet khul jae');
          // Navigator.pushNamed(context,'/inventoryScreen');
        },
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.center,
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
                      style:
                          TextStyle(color: kSecondaryTextColor, fontSize: 12.0),
                    ),
                  ],
                ),
                width: 60.0,
                height: 55.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                  border: Border.all(color: Colors.black54),
                ),
              ),
              kBlackDivider2,
              RichText(
                // Quantity of gold item
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
              kBlackDivider2,
              RichText(
                // Karrot of gold item
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
              kBlackDivider2,
              RichText(
                // Price of gold item
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
      ),
    );
  }
}
