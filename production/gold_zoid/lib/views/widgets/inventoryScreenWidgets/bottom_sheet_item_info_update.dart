import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';

class BottomSheetItemInfoUpdate extends StatelessWidget {
  final String text;
  final Function onMinus;
  final Function onPlus;
  final String quantity;

  BottomSheetItemInfoUpdate(
      {@required this.text,
      @required this.onMinus,
      @required this.onPlus,
      @required this.quantity});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                '$text :',
                style: TextStyle(
                  color: kPrimaryTextColor,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: onMinus,
            child: Container(
              child: Center(
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 25.0,
                ),
              ),
              height: 40.0,
              width: 60.0,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                quantity, //TODO: yahan number update huga by plus minus (increment by 5)
                style: TextStyle(
                  color: kSecondaryTextColor,
                ),
              ),
            ),
            height: 40.0,
            width: 90.0,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
          InkWell(
            onTap: onPlus,
            child: Container(
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 25.0,
                ),
              ),
              height: 40.0,
              width: 60.0,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
