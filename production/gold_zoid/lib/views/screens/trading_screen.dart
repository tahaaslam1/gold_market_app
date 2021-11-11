import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/views/titles/common_title.dart';
import 'package:gold_zoid/views/widgets/drawer/custom_drawer.dart';
import 'package:gold_zoid/views/widgets/trading_screen_widgets/residual.dart';
import 'package:gold_zoid/views/widgets/trading_screen_widgets/customKeyPad.dart';
import 'package:gold_zoid/views/widgets/trading_screen_widgets/tradeOption.dart';
import 'package:gold_zoid/views/widgets/trading_screen_widgets/bottom_trade_button.dart';

class Trade_Page extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: CustomDrawer(
        onTap: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CommonTitle(
                onTap: () => _scaffoldKey.currentState.openEndDrawer(),
                mainTitleText: 'Buy / Sell',
                icon: Icon(
                  Icons.monetization_on_rounded,
                  size: 35.0,
                  color: kTitleIconColor,
                ),
                sideText: 'earn your profit',
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TradeOption(
                    tradeOption: 'Buy',
                    color: kActiveColor,
                  ),
                  TradeOption(
                    tradeOption: 'Sell',
                    color: kInActiveColor,
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Divider(
                color: kPrimaryColor,
                thickness: 1.0,
                endIndent: 90.0,
                indent: 90.0,
              ),
              SizedBox(
                height: 5.0,
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
                    Residual(
                      residualName: 'Item :',
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
              //SizedBox(height: 10.0),
              CustomKeyboard(),
              BottomTradeButton(
                finalTradeOption: 'Buy GOLD',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
