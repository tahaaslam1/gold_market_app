import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';

class CurrentMetalPriceWidget extends StatelessWidget {
  final String metal_image;
  final String metal_name;
  final String high_quality_metal_grade;
  final String avg_quality_metal_grade;
  final String high_quality_metal_price;
  final String avg_quality_metal_price;

  CurrentMetalPriceWidget({
    @required this.metal_image,
    @required this.metal_name,
    @required this.high_quality_metal_grade,
    @required this.avg_quality_metal_grade,
    @required this.high_quality_metal_price,
    @required this.avg_quality_metal_price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    metal_image,
                    height: 46.0,
                    width: 46.0,
                  ),
                  Text(
                    metal_name,
                    style: TextStyle(
                      color: kPrimaryTextColor,
                      fontSize: 15.0,
                    ),
                  )
                ],
              ),
              height: 76,
              width: 80,
              decoration: BoxDecoration(
                color: kGoldIconContainerColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          kBlackDivider,
          SizedBox(
            height: 5.0,
          ),
          RichText(
            text: TextSpan(
              text: '$high_quality_metal_grade : ',
              style: TextStyle(
                color: kPrimaryTextColor,
                fontSize: 14.0,
                fontFamily: 'Avenir',
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '\$$high_quality_metal_price',
                  style: TextStyle(
                    color: kSecondaryTextColor,
                    fontSize: 14.0,
                    fontFamily: 'Avenir',
                  ),
                ),
                TextSpan(
                  text: '/10gr',
                  style: TextStyle(
                    color: kSecondaryTextColor,
                    fontSize: 10.0,
                    fontFamily: 'Avenir',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          kBlackDivider,
          SizedBox(
            height: 5.0,
          ),
          RichText(
            text: TextSpan(
              text: '$avg_quality_metal_grade : ',
              style: TextStyle(
                color: kPrimaryTextColor,
                fontSize: 14.0,
                fontFamily: 'Avenir',
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '\$$avg_quality_metal_price',
                  style: TextStyle(
                    color: kSecondaryTextColor,
                    fontSize: 14.0,
                    fontFamily: 'Avenir',
                  ),
                ),
                TextSpan(
                  text: '/10gr',
                  style: TextStyle(
                    color: kSecondaryTextColor,
                    fontSize: 10.0,
                    fontFamily: 'Avenir',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      height: 211.0,
      width: 150.0,
      padding: EdgeInsets.only(left: 25.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            spreadRadius: 2.0,
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
    );
  }
}
