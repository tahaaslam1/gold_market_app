import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/controllers/inventory_item_controller.dart';
import 'package:gold_zoid/controllers/user_login_signup_controller.dart';
import 'package:gold_zoid/models/item_model.dart';
import 'package:gold_zoid/views/widgets/inventoryScreenWidgets/ItemInfoWidget.dart';
import 'package:gold_zoid/views/widgets/inventoryScreenWidgets/ItemTypeWidget.dart';
import 'package:gold_zoid/views/widgets/inventoryScreenWidgets/item_info_widget_2.dart';
import 'package:gold_zoid/views/widgets/inventoryScreenWidgets/bottom_sheet_item_info_update.dart';
import 'package:provider/provider.dart';

class ItemListScreen extends StatefulWidget {
  @override
  State<ItemListScreen> createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  List<Item> ringList = [];
  List<Item> earringList = [];
  List<Item> pendantList = [];
  List<Item> nosepinList = [];
  List<Item> necklaceList = [];
  List<Item> bangleList = [];
  List<Item> braceletList = [];
  List<Item> chainList = [];

  @override
  Widget build(BuildContext context) {
    ringList = context.watch<ItemController>().getRingList;
    earringList = context.watch<ItemController>().getEarringList;
    pendantList = context.watch<ItemController>().getPendantList;
    nosepinList = context.watch<ItemController>().getNosepinList;
    necklaceList = context.watch<ItemController>().getNecklaceList;
    bangleList = context.watch<ItemController>().getBangleList;
    braceletList = context.watch<ItemController>().getBraceletList;
    chainList = context.watch<ItemController>().getChainList;

    var args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        splashColor: Colors.amber[800],
        onPressed: () {
          _showAddNewItemBottomSheet(context, args);
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
                      args.toString(), //TODO: yahan animation and provider se item name aega like bangle wagera
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
              child: ListView(
                //scrollDirection: Axis.horizontal,
                children: <Widget>[
                  if (args == 'ring')
                    for (var item in ringList)
                      ItemInfoWidget2(
                        itemType: item.type.toString(),
                        itemId: item.itemId.toString(),
                        itemKarrot: item.karrot.toString(),
                        itemQty: item.qty.toString(),
                        itemValue: item.itemValue.toStringAsFixed(2),
                        itemWeight: item.weightInGramsPerUnit.toString(),
                      ),
                  if (args == 'pendant')
                    for (var item in pendantList)
                      ItemInfoWidget2(
                        itemId: item.itemId.toString(),
                        itemType: item.type.toString(),
                        itemKarrot: item.karrot.toString(),
                        itemQty: item.qty.toString(),
                        itemValue: item.itemValue.toStringAsFixed(2),
                        itemWeight: item.weightInGramsPerUnit.toString(),
                      ),
                  if (args == 'chain')
                    for (var item in chainList)
                      ItemInfoWidget2(
                        itemId: item.itemId.toString(),
                        itemType: item.type.toString(),
                        itemKarrot: item.karrot.toString(),
                        itemQty: item.qty.toString(),
                        itemValue: item.itemValue.toStringAsFixed(2),
                        itemWeight: item.weightInGramsPerUnit.toString(),
                      ),
                  if (args == 'bangle')
                    for (var item in bangleList)
                      ItemInfoWidget2(
                        itemId: item.itemId.toString(),
                        itemType: item.type.toString(),
                        itemKarrot: item.karrot.toString(),
                        itemQty: item.qty.toString(),
                        itemValue: item.itemValue.toStringAsFixed(2),
                        itemWeight: item.weightInGramsPerUnit.toString(),
                      ),
                  if (args == 'bracelet')
                    for (var item in braceletList)
                      ItemInfoWidget2(
                        itemId: item.itemId.toString(),
                        itemType: item.type.toString(),
                        itemKarrot: item.karrot.toString(),
                        itemQty: item.qty.toString(),
                        itemValue: item.itemValue.toStringAsFixed(2),
                        itemWeight: item.weightInGramsPerUnit.toString(),
                      ),
                  if (args == 'earring')
                    for (var item in earringList)
                      ItemInfoWidget2(
                        itemId: item.itemId.toString(),
                        itemType: item.type.toString(),
                        itemKarrot: item.karrot.toString(),
                        itemQty: item.qty.toString(),
                        itemValue: item.itemValue.toStringAsFixed(2),
                        itemWeight:  item.weightInGramsPerUnit.toString(),
                      ),
                  if (args == 'necklace')
                    for (var item in necklaceList)
                      ItemInfoWidget2(
                        itemId: item.itemId.toString(),
                        itemType: item.type.toString(),
                        itemKarrot: item.karrot.toString(),
                        itemQty: item.qty.toString(),
                        itemValue: item.itemValue.toStringAsFixed(2),
                        itemWeight: item.weightInGramsPerUnit.toString(),
                      ),
                  if (args == 'nosepin')
                    for (var item in nosepinList)
                      ItemInfoWidget2(
                        itemId: item.itemId.toString(),
                        itemType: item.type.toString(),
                        itemKarrot: item.karrot.toString(),
                        itemQty: item.qty.toString(),
                        itemValue: item.itemValue.toStringAsFixed(2),
                        itemWeight: item.weightInGramsPerUnit.toString(),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showAddNewItemBottomSheet(context, Object args) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15.0),
        topRight: Radius.circular(15.0),
      ),
    ),
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Wrap(children: [addNewItemBottomSheetMenu(context, args)]);
    },
  );
}

Column addNewItemBottomSheetMenu(BuildContext context, Object args) {
  void _passSnackbar(String msg) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(),
      ),
    );
    //_scaffoldKey.currentState.showSnackBar(snackBar);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _failSnackbar(String error) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        error,
        textAlign: TextAlign.center,
        style: TextStyle(),
      ),
    );
    //_scaffoldKey.currentState.showSnackBar(snackBar);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _tryAddNewItem() async {
    var response = await context.read<ItemController>().addNewItem(
        itemType: args,
        userEmailId:
            context.read<UserLoginSignUpController>().getLoggedInUser.emailId);

    if (response == 'Item Added') {
      _passSnackbar('Item Added');
      Navigator.of(context).pop();
    } else {
      _failSnackbar('Item Not Added');
    }
  }

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
              'Add New Gold Item for ${args}',
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
        quantity: '${context.watch<ItemController>().getWeight}',
        onMinus: () {
          context.read<ItemController>().decrementWeight();
        },
        onPlus: () {
          context.read<ItemController>().incrementWeight();
        },
      ),
      SizedBox(height: 30.0),
      BottomSheetItemInfoUpdate(
        text: 'Quantity',
        quantity: '${context.watch<ItemController>().getquantity}',
        onMinus: () {
          context.read<ItemController>().decrementQuantity();
        },
        onPlus: () {
          context.read<ItemController>().incrementQuantity();
        },
      ),
      SizedBox(height: 30.0),
      BottomSheetItemInfoUpdate(
        text: 'Karrot',
        quantity: '${context.watch<ItemController>().getkarrot}',
        onMinus: () {
          context.read<ItemController>().decrementKarrot();
        },
        onPlus: () {
          context.read<ItemController>().incrementKarrot();
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
              _tryAddNewItem();
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
