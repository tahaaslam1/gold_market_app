import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';

class EditNameOrNumber extends StatelessWidget {
  final Widget icon;
  final String type;
  final String attribute;
  final Function onTap;
  EditNameOrNumber(
      {@required this.icon, @required this.type, @required this.attribute,@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:10.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: icon,
          ),
          Expanded(
            flex: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type,
                  style: TextStyle(
                    fontSize: 13.0,
                    color: kSecondaryTextColor,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  attribute,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: kSecondaryTextColor,
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(
          //   width: 100.0,
          // ), // media query  daaalo idher ....... ... . . .. . . . .. . . . . . .here . . .. . . . .. .
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: onTap,
              child: Icon(
                Icons.edit,
                size: 25.0,
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
