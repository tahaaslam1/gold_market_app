import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';


class CustomListTile extends StatelessWidget {
  final String titleText; 
  final IconData leadingIcon;
  final Function onTap;
  CustomListTile({@required this.titleText,@required this.leadingIcon,@required this.onTap});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.only(left: 45.0),
      leading: Icon(
        leadingIcon,
        color: kActiveColor,
        size: 35.0,
      ),
      title: Text(
        titleText,
        style: TextStyle(
          fontSize: 20.0,
          color: kInActiveColor,
        ),
      ),
    );
  }
}
