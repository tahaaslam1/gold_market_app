import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/views/widgets/inventoryScreenWidgets/ItemInfoWidget.dart';
import 'package:gold_zoid/views/widgets/inventoryScreenWidgets/ItemTypeWidget.dart';
import 'package:gold_zoid/views/widgets/inventoryScreenWidgets/item_info_widget_2.dart';
import 'package:gold_zoid/views/widgets/inventoryScreenWidgets/bottom_sheet_item_info_update.dart';

class ItemListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        splashColor: Colors.amber[800],
        onPressed: () {
          _showAddNewItemTypeBottomSheet(context);
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

void _showAddNewItemTypeBottomSheet(context) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius:BorderRadius.only(topLeft: Radius.circular(15.0),topRight: Radius.circular(15.0),), 
    ),
    isScrollControlled: true,
    context: context,
    builder: (BuildContext bc) {
      return Wrap(children: [addNewItemBottomSheetMenu()]);
    },
  );
}

Column addNewItemBottomSheetMenu() {
  return Column(
      children: [
        SizedBox(
          height: 3.0,
        ),
        Divider(
          height: 20.0,
          color: kPrimaryTextColor,
          thickness: 3.0,
          endIndent: 160.0,
          indent: 160.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'Add New Gold Item',
                style: TextStyle(
                  color: kSecondaryTextColor,
                  fontSize: 17.0,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40.0,
        ),
        BottomSheetItemInfoUpdate(
          text: 'Weight',
          quantity: '2',
          onMinus: () {
            print('decrement by 5');
          },
          onPlus: () {
            print('increment by 5');
          },
        ),
        SizedBox(height: 30.0),
        BottomSheetItemInfoUpdate(
          text: 'Quantity',
          quantity: '2',
          onMinus: () {
            print('decrement by 1');
          },
          onPlus: () {
            print('increment by 1');
          },
        ),
        SizedBox(height: 30.0),
        BottomSheetItemInfoUpdate(
          text: 'Karrot',
          quantity: '2',
          onMinus: () {
            print('decrement from 24 to miinmum karrot jou huta h');
          },
          onPlus: () {
            print('increment from min karrot jou huta h to 24k ');
          },
        ),
        SizedBox(
          height: 20.0,
        ),
        Divider(
          color: kPrimaryTextColor,
          thickness: 1.0,
        ),
        SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Center(
            child: InkWell(
              onTap: () {
                print("add the new item");
              },
              child: Text(
                'Add item',
                style: TextStyle(
                  color: kPrimaryTextColor,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
}
