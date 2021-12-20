import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/controllers/inventory_item_controller.dart';
import 'package:gold_zoid/views/widgets/inventoryScreenWidgets/ItemInfoWidget.dart';
import 'package:provider/provider.dart';

class ItemTypeWidget extends StatelessWidget {
  final String itemType;
  ItemTypeWidget({@required this.itemType});

  @override
  Widget build(BuildContext context) {
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
                  itemType,
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
                    Navigator.pushNamed(context, '/itemListScreen');
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
            child: Consumer<ItemController>(
              builder: (context, provider, _) {
                return ListView.builder(
                  padding  : EdgeInsets.only(left: 30.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: provider.itemList.length,
                  itemBuilder: (BuildContext context, index) {
                    return ItemInfoWidget(
                      itemKarrot:    provider.itemList[index].karrot.toString(),
                      itemWeight:       provider.itemList[index].weightInGramsPerUnit.toString(),
                      itemValue:         provider.itemList[index].itemValue.toString(),
                      itemQty:       provider.itemList[index].qty.toString(),
                    );
                  },
                );

                // ListView(
                //   padding: EdgeInsets.only(left: 30.0),
                //   scrollDirection: Axis.horizontal,
                //   children: <Widget>[
                //     ItemInfoWidget(
                //       itemKarrot: itemKarrot,
                //       itemQty: itemQty,
                //       itemValue: itemValue,
                //       itemWeight: itemWeight,
                //     ),
                //     ItemInfoWidget(
                //       itemKarrot: itemKarrot,
                //       itemQty: itemQty,
                //       itemValue: itemValue,
                //       itemWeight: itemWeight,
                //     ),
                //     ItemInfoWidget(
                //       itemKarrot: itemKarrot,
                //       itemQty: itemQty,
                //       itemValue: itemValue,
                //       itemWeight: itemWeight,
                //     ),
                //     ItemInfoWidget(
                //       itemKarrot: itemKarrot,
                //       itemQty: itemQty,
                //       itemValue: itemValue,
                //       itemWeight: itemWeight,
                //     ),
                //     ItemInfoWidget(
                //       itemKarrot: itemKarrot,
                //       itemQty: itemQty,
                //       itemValue: itemValue,
                //       itemWeight: itemWeight,
                //     ),
                //   ],
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}
