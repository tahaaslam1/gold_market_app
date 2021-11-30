import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';

class EditNameOrNumber extends StatelessWidget {
  final Widget icon;
  final String type;
  final String attribute;
  EditNameOrNumber(
      {@required this.icon, @required this.type, @required this.attribute});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          flex: 1,
          child: icon,
        ),

        SizedBox(
          width: 20.0,
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
                height: 5.0,
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
        SizedBox(
          width: 100.0,
        ), // media query  daaalo idher ....... ... . . .. . . . .. . . . . . .here . . .. . . . .. .
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () {
              //TODO: open a bottom sheet for changing name of user
            },
            child: Icon(
              Icons.edit,
              size: 25.0,
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
