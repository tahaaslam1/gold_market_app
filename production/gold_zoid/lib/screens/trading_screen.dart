import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/commonWidgets/drawer_button.dart';
import 'package:gold_zoid/titles/common_title.dart';
import 'package:gold_zoid/trading_screen_widgets/residual.dart';

class Trade_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CommonTitle(
                mainTitleText: 'Buy / Sell',
                icon: Icon(Icons.monetization_on_rounded, size: 35.0),
                sideText: 'earn your profit',
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
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
                      color: kActiveColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Buy',
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
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
                      color: kInActiveColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Sell',
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Divider(
                color: kPrimaryColor,
                thickness: 1.0,
                endIndent: 90.0,
                indent: 90.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              RichText(
                text: TextSpan(
                  text: 'Buy ',
                  style: TextStyle(
                    color: kSecondaryTextColor,
                    fontSize: 25.0,
                    fontFamily: 'Avenir',
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'GOLD',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 25.0,
                        fontFamily: 'Avenir',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Residual(
                      residualName: 'Weight :',
                      residualValue: null,
                    ),
                    Residual(
                      residualName: 'Market Price :',
                      residualValue: null,
                    ),
                    Residual(
                      residualName: 'Wastage :',
                      residualValue: null,
                    ),
                    Residual(
                      residualName: 'Labor :',
                      residualValue: null,
                    ),
                  ],
                ),
                height: 200.0,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2.0,
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 10,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
              ),
              Container(
                height: 252,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
