import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/titles/common_title.dart';
import 'package:gold_zoid/titles/common_title.dart';

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
            Column(
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
                ItemInfoWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ItemInfoWidget extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
                  '40gr',
                  style: TextStyle(color: kSecondaryTextColor, fontSize: 12.0),
                ),
              ],
            ),
            width: 60.0,
            height: 55.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
              border: Border.all(color: kSecondaryTextColor),
            ),
          ),
          kBlackDivider,
          Text(''),
        ],
      ),
      height: 170.0,
      width: 115,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            spreadRadius: 1.0,
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }
}
