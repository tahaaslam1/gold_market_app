import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/views/widgets/inventoryScreenWidgets/ItemInfoWidget.dart';

class ItemTypeWidget extends StatelessWidget {
  
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
                  'Item Name',
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
                ItemInfoWidget(),
                ItemInfoWidget(),
                ItemInfoWidget(),
                ItemInfoWidget(),
                ItemInfoWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
