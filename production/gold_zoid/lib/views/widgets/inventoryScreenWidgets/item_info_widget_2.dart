import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/views/widgets/inventoryScreenWidgets/bottom_sheet_item_info_update.dart';

class ItemInfoWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onLongPress: () {
          _showDeleteUpdateBottomSheet(context);
          print('item delete krne ki bottom sheet khul jae');
          // Navigator.pushNamed(context,'/inventoryScreen');
        },
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
                      '40gr',
                      style:
                          TextStyle(color: kSecondaryTextColor, fontSize: 12.0),
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
                      text: '2',
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
                  text: '22 ',
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
                      text: '75',
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
    );
  }
}
void _showDeleteUpdateBottomSheet(context) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius:BorderRadius.only(topLeft: Radius.circular(15.0),topRight: Radius.circular(15.0),), 
    ),
    isScrollControlled: true,
    context: context,
    builder: (BuildContext bc) {
      return Wrap(children: [_deleteUpdateBottomSheetMenu()]);
    },
  );
}
Column _deleteUpdateBottomSheetMenu() {
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
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'Delete Gold Item',
                style: TextStyle(
                  color: kSecondaryTextColor,
                  fontSize: 17.0,
                ),
              ),
            ),
             Padding(
               padding: const EdgeInsets.only(right:15.0),
               child: InkWell(
                    onTap: () {
                      //TODO: delete current selected item logic 
                      // some logic...
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          'Delete item',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      height: 40.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                        
                        color: Colors.red[400],
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
             ),
          ],
        ),
        SizedBox(height: 20.0,),
        Divider(
          color: kPrimaryTextColor,
          thickness: 1.0,
        ),
        SizedBox(height: 10.0,),
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
