import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/controllers/inventory_item_controller.dart';
import 'package:gold_zoid/controllers/user_controller.dart';
import 'package:gold_zoid/controllers/user_login_signup_controller.dart';
import 'package:gold_zoid/models/item_model.dart';
import 'package:gold_zoid/views/titles/common_title.dart';
import 'package:gold_zoid/views/widgets/drawer/custom_drawer.dart';
import 'package:gold_zoid/views/widgets/inventoryScreenWidgets/ItemTypeWidget.dart';
import 'package:gold_zoid/views/widgets/inventoryScreenWidgets/bottom_sheet_item_info_update.dart';
import 'package:provider/provider.dart';

class Inventory_Page extends StatefulWidget {
  @override
  State<Inventory_Page> createState() => _Inventory_PageState();
}

class _Inventory_PageState extends State<Inventory_Page> {
  var _itemsInfoStatus;
  List<Item> _ringList = [];
  List<Item> _earringList = [];
  List<Item> _pendantList = [];
  List<Item> _nosepinList = [];
  List<Item> _necklaceList = [];
  List<Item> _bangleList = [];
  List<Item> _braceletList = [];
  List<Item> _chainList = [];

  final itemTypes = [
    'rings',
    'bangles',
    'necklace',
    'earring',
    'chain',
    'bracelet',
    'nosepin',
    'pendant'
  ];
  String value;
  @override
  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: Text(item),
    );
  }
  // @override
  // void didChangeDependencies() {
  //   getItems().then((value) => setState(() {}));

  //   super.didChangeDependencies();
  // }

  @override
  void initState() {
    getItems().then((value) => setState(() {}));
    super.initState();
  }

  Future getItems() async {
    await Provider.of<ItemController>(context, listen: false).getItemList(
      userId: Provider.of<UserController>(context, listen: false)
          .getLoggedInUser
          .userId
          .toString(),
    );

    _itemsInfoStatus = 'gotten';
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    _ringList = context.watch<ItemController>().getRingList;
    _earringList = context.watch<ItemController>().getEarringList;
    _pendantList = context.watch<ItemController>().getPendantList;
    _nosepinList = context.watch<ItemController>().getNosepinList;
    _necklaceList = context.watch<ItemController>().getNecklaceList;
    _bangleList = context.watch<ItemController>().getBangleList;
    _braceletList = context.watch<ItemController>().getBraceletList;
    _chainList = context.watch<ItemController>().getChainList;

    if (_itemsInfoStatus == null) {
      return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              CommonTitle(
                sideText: 'manage your inventory',
                mainTitleText: 'My Inventory',
                icon: Icon(
                  Icons.person_outline,
                  size: 35.0,
                  color: kTitleIconColor,
                ),
              ),
              Expanded(
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

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
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                    ),
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
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
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }

                          void _failSnackbar(String msg) {
                            final snackBar = SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text(
                                msg,
                                textAlign: TextAlign.center,
                                style: TextStyle(),
                              ),
                            );
                            //_scaffoldKey.currentState.showSnackBar(snackBar);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }

                          _tryaddNewItem() async {
                            var msg = await context
                                .read<ItemController>()
                                .addNewItem(
                                    userEmailId: context
                                        .read<UserController>()
                                        .getLoggedInUser
                                        .emailId,
                                    itemType: value);

                            if (msg == 'Item Added') {
                              Navigator.of(context).pop();
                              _passSnackbar(msg);
                            } else {
                              _failSnackbar('Item not added');
                            }
                          }

                          return Wrap(
                            children: [
                              Column(
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
                                        padding:
                                            const EdgeInsets.only(left: 15.0),
                                        child: Text(
                                          'Add New Gold Item Type',
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
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Item Type :',
                                            style: TextStyle(
                                              color: kPrimaryTextColor,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ),
                                        DropdownButton<String>(
                                          value: value,
                                          items: itemTypes
                                              .map(buildMenuItem)
                                              .toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              this.value = value;
                                            });
                                          },
                                          hint: Text(
                                            'select item',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  BottomSheetItemInfoUpdate(
                                    text: 'Weight',
                                    quantity:
                                        '${context.watch<ItemController>().getWeight}',
                                    onMinus: () {
                                      context
                                          .read<ItemController>()
                                          .decrementWeight();
                                    },
                                    onPlus: () {
                                      context
                                          .read<ItemController>()
                                          .incrementWeight();
                                    },
                                  ),
                                  SizedBox(height: 30.0),
                                  BottomSheetItemInfoUpdate(
                                    text: 'Quantity',
                                    quantity:
                                        '${context.watch<ItemController>().getquantity}',
                                    onMinus: () {
                                      context
                                          .read<ItemController>()
                                          .decrementQuantity();
                                    },
                                    onPlus: () {
                                      context
                                          .read<ItemController>()
                                          .incrementQuantity();
                                    },
                                  ),
                                  SizedBox(height: 30.0),
                                  BottomSheetItemInfoUpdate(
                                    text: 'Karrot',
                                    quantity:
                                        '${context.watch<ItemController>().getkarrot}',
                                    onMinus: () {
                                      context
                                          .read<ItemController>()
                                          .decrementKarrot();
                                    },
                                    onPlus: () {
                                      context
                                          .read<ItemController>()
                                          .incrementKarrot();
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
                                    padding:
                                        const EdgeInsets.only(bottom: 15.0),
                                    child: Center(
                                      child: InkWell(
                                        onTap: () {
                                          _tryaddNewItem(); //context.read<ItemController>().addNewItem(userEmailId: context.read<UserController>().getLoggedInUser.emailId,itemType: value);
                                        },
                                        child: Text(
                                          'Add item type',
                                          style: TextStyle(
                                            color: kPrimaryTextColor,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                  // _showAddItemTypeBottomSheet(context);
                  print('add new  item in inventory');
                },
                child: Text(
                  'Add new Item type',
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
                  if (_ringList.isNotEmpty)
                    ItemTypeWidget(itemType: _ringList.first.type),
                  if (_earringList.isNotEmpty)
                    ItemTypeWidget(itemType: _earringList.first.type),
                  if (_pendantList.isNotEmpty)
                    ItemTypeWidget(itemType: _pendantList.first.type),
                  if (_nosepinList.isNotEmpty)
                    ItemTypeWidget(itemType: _nosepinList.first.type),
                  if (_necklaceList.isNotEmpty)
                    ItemTypeWidget(itemType: _necklaceList.first.type),
                  if (_bangleList.isNotEmpty)
                    ItemTypeWidget(itemType: _bangleList.first.type),
                  if (_braceletList.isNotEmpty)
                    ItemTypeWidget(itemType: _braceletList.first.type),
                  if (_chainList.isNotEmpty)
                    ItemTypeWidget(itemType: _chainList.first.type),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showAddItemTypeBottomSheet(BuildContext context) {
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
      return Wrap(children: [addNewItemTypeBottomSheetMenu(context)]);
    },
  );
}

Column addNewItemTypeBottomSheetMenu(BuildContext context) {
  final itemTypes = [
    'rings',
    'bangles',
    'necklace',
    'earring',
    'chain',
    'bracelet',
    'nosepin',
    'pendant'
  ];

  @override
  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: Text(item),
    );
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
              'Add New Gold Item Type',
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
      Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Item Type :',
                style: TextStyle(
                  color: kPrimaryTextColor,
                  fontSize: 15.0,
                ),
              ),
            ),
            DropdownButton(
              value: context.watch<ItemController>().getItemType,
              items: itemTypes.map(buildMenuItem).toList(),
              onChanged: (value) {
                context.read<ItemController>().selectItemType(value);
              },
              hint: Text(
                'select item',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 30.0,
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
              'Add item type',
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
