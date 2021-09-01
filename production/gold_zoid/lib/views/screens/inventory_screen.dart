import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/views/titles/common_title.dart';
import 'package:gold_zoid/views/widgets/inventoryScreenWidgets/ItemTypeWidget.dart';

class Inventory_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CommonTitle(
              mainTitleText: 'My Inventory',
              sideText: 'manage your inventory',
              icon: Icon(
                Icons.person_outline,
                size: 35.0,
                color: kTitleIconColor,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: InkWell(
                onTap: () {
                  print('add new  item in inventory');
                },
                child: Text(
                  'Add new Item',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: kPrimaryTextColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ItemTypeWidget(),
                  ItemTypeWidget(),
                  ItemTypeWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
