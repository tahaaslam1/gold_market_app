import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/views/widgets/inventoryScreenWidgets/ItemInfoWidget.dart';
import 'package:gold_zoid/views/widgets/inventoryScreenWidgets/ItemTypeWidget.dart';
import 'package:gold_zoid/views/widgets/inventoryScreenWidgets/item_info_widget_2.dart';

class ItemListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        splashColor: Colors.amber[800],
        onPressed: () {
          print('add new item type item');
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 25.0, left: 10.0, bottom: 25.0),
              child: Row(
                children: [
                  InkWell(
                      splashColor: Colors.amber[100],
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: kPrimaryColor,
                        size: 40.0,
                      )),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Text(
                      'Item Type', //TODO: yahan animation and provider se item name aega like bangle wagera
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              //color: Colors.red,
              child: ListView(
                //scrollDirection: Axis.horizontal,
                children: <Widget>[
                  ItemInfoWidget2(),
                  ItemInfoWidget2(),
                  ItemInfoWidget2(),
                  ItemInfoWidget2(),
                  ItemInfoWidget2(),
                  ItemInfoWidget2(),
                  ItemInfoWidget2(),
                  ItemInfoWidget2(),
                  ItemInfoWidget2(),
                  ItemInfoWidget2(),
                  ItemInfoWidget2(),
                  ItemInfoWidget2(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
