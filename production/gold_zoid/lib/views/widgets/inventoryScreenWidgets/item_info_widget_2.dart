import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/controllers/inventory_item_controller.dart';
import 'package:gold_zoid/controllers/user_controller.dart';
import 'package:gold_zoid/controllers/user_inventory_controller.dart';
import 'package:gold_zoid/models/inventory_model.dart';
import 'package:gold_zoid/views/widgets/inventoryScreenWidgets/bottom_sheet_item_info_update.dart';
import 'package:provider/provider.dart';

class ItemInfoWidget2 extends StatelessWidget {
  final String itemWeight;
  final String itemQty;
  final String itemKarrot;
  final String itemValue;
  final String itemId;
  final String itemType;
  ItemInfoWidget2(
      {@required this.itemKarrot,
      @required this.itemQty,
      @required this.itemWeight,
      @required this.itemValue,
      @required this.itemId,
      @required this.itemType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onLongPress: () {
          _showUpdateBottomSheet(context);
          print('item delete krne ki bottom sheet khul jae');
          // Navigator.pushNamed(context,'/inventoryScreen');
        },
        child: Dismissible(
          direction: DismissDirection.startToEnd,
          confirmDismiss: (direction) {
            return showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text('Are you sure?'),
                content: Text(
                  'Do you want to remove the item?',
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      'No',
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    onPressed: () {
                      Navigator.of(ctx).pop(false);
                    },
                  ),
                  TextButton(
                    child: Text(
                      'Yes',
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    onPressed: () {
                      Navigator.of(ctx).pop(true);
                    },
                  ),
                ],
              ),
            );
          },
          onDismissed: (direction) {
            context.read<ItemController>().deleteItem(
                  userId: context.read<UserController>().getLoggedInUser.userId,
                  inventoryId: context
                      .read<UserInventoryController>()
                      .getLoggedInUserInventory
                      .inventoryId,
                  itemId: itemId,
                  itemType: itemType,
                );
            //TODO: call delete function...
          },
          background: Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          key: ValueKey(itemId),
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
                        '${itemWeight}',
                        style: TextStyle(
                            color: kSecondaryTextColor, fontSize: 12.0),
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
                        text: '$itemQty',
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
                    text: '$itemKarrot',
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
                        text: '$itemValue',
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
      ),
    );
  }
}

void _showUpdateBottomSheet(context) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15.0),
        topRight: Radius.circular(15.0),
      ),
    ),
    isScrollControlled: true,
    context: context,
    builder: (BuildContext bc) {
      return Wrap(children: [_updateBottomSheetMenu()]);
    },
  );
}

Column _updateBottomSheetMenu() {
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
        height: 10.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'Update Gold Item',
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
              'Update item',
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
