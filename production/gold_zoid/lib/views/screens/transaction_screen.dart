import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/views/widgets/inventoryScreenWidgets/ItemInfoWidget.dart';
import 'package:gold_zoid/views/widgets/inventoryScreenWidgets/ItemTypeWidget.dart';
import 'package:gold_zoid/views/widgets/inventoryScreenWidgets/item_info_widget_2.dart';
import 'package:gold_zoid/views/widgets/inventoryScreenWidgets/bottom_sheet_item_info_update.dart';
import 'package:gold_zoid/views/widgets/drawer/custom_drawer.dart';
import 'package:gold_zoid/views/titles/common_title.dart';
import 'package:gold_zoid/views/widgets/transaction_screen_widgets/trasaction_info_widget.dart';

class TransactionScreen extends StatelessWidget {
final  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: CustomDrawer(
        onTap: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CommonTitle(
              onTap: () => _scaffoldKey.currentState.openEndDrawer(),
              mainTitleText: 'Transactions',
              sideText: 'View your transactions',
              icon: Icon(
                Icons.attach_money,
                size: 35.0,
                color: kTitleIconColor,
              ),
            ),
            Expanded(
              //color: Colors.red,
              child: ListView(
                //scrollDirection: Axis.horizontal,
                children: <Widget>[
                  TransactionInfoWidget(),
                  TransactionInfoWidget(),
                  TransactionInfoWidget(),
                  TransactionInfoWidget(),
                  TransactionInfoWidget(),
                  TransactionInfoWidget(),
                  TransactionInfoWidget(),
                  TransactionInfoWidget(),
                  TransactionInfoWidget(),
                  TransactionInfoWidget(),
                  TransactionInfoWidget(),
                  TransactionInfoWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}