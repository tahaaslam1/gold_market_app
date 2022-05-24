import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/controllers/inventory_item_controller.dart';
import 'package:gold_zoid/models/item_model.dart';
import 'package:gold_zoid/views/widgets/inventoryScreenWidgets/ItemInfoWidget.dart';
import 'package:provider/provider.dart';

class ItemTypeWidget extends StatefulWidget {
  final String itemType;

  ItemTypeWidget({@required this.itemType});

  @override
  State<ItemTypeWidget> createState() => _ItemTypeWidgetState();
}

class _ItemTypeWidgetState extends State<ItemTypeWidget> {
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

    return Container(
      //color: Colors.black,
      height: 220.0,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: Text(
                  widget.itemType,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: kPrimaryTextColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/itemListScreen',
                        arguments: widget.itemType);
                    print(
                      'view all (for particular item)',
                    );
                  },
                  child: Text(
                    'Veiw all',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: kPrimaryTextColor,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 180.0,
            child: ListView(
              padding: EdgeInsets.only(left: 30.0),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                if (widget.itemType == 'ring')
                  for (var item in ringList)
                    ItemInfoWidget(
                      itemKarrot: item.karrot.toString(),
                      itemQty: item.qty.toString(),
                      itemValue: item.itemValue.toStringAsFixed(2),
                      itemWeight: item.weightInGramsPerUnit.toString(),
                    ),
                if (widget.itemType == 'bracelet')
                  for (var item in braceletList)
                    ItemInfoWidget(
                      itemKarrot: item.karrot.toString(),
                      itemQty: item.qty.toString(),
                      itemValue: item.itemValue.toStringAsFixed(2),
                      itemWeight: item.weightInGramsPerUnit.toString(),
                    ),
                if (widget.itemType == 'nosepin')
                  for (var item in nosepinList)
                    ItemInfoWidget(
                      itemKarrot: item.karrot.toString(),
                      itemQty: item.qty.toString(),
                      itemValue: item.itemValue.toStringAsFixed(2),
                      itemWeight: item.weightInGramsPerUnit.toString(),
                    ),
                if (widget.itemType == 'necklace')
                  for (var item in necklaceList)
                    ItemInfoWidget(
                      itemKarrot: item.karrot.toString(),
                      itemQty: item.qty.toString(),
                      itemValue: item.itemValue.toStringAsFixed(2),
                      itemWeight: item.weightInGramsPerUnit.toString(),
                    ),
                if (widget.itemType == 'chain')
                  for (var item in chainList)
                    ItemInfoWidget(
                      itemKarrot: item.karrot.toString(),
                      itemQty: item.qty.toString(),
                      itemValue: item.itemValue.toStringAsFixed(2),
                      itemWeight: item.weightInGramsPerUnit.toString(),
                    ),
                if (widget.itemType == 'bangle')
                  for (var item in bangleList)
                    ItemInfoWidget(
                      itemKarrot: item.karrot.toString(),
                      itemQty: item.qty.toString(),
                      itemValue: item.itemValue.toStringAsFixed(2),
                      itemWeight: item.weightInGramsPerUnit.toString(),
                    ),
                if (widget.itemType == 'pendant')
                  for (var item in pendantList)
                    ItemInfoWidget(
                      itemKarrot: item.karrot.toString(),
                      itemQty: item.qty.toString(),
                      itemValue: item.itemValue.toStringAsFixed(2),
                      itemWeight: item.weightInGramsPerUnit.toString(),
                    ),
                if (widget.itemType == 'earring')
                  for (var item in earringList)
                    ItemInfoWidget(
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
    );
  }
}
