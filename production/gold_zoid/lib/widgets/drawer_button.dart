import 'package:gold_zoid/constants.dart';
import 'package:flutter/material.dart';


class DrawerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print('drawer button is pressed');
      },
          child: Container(
          width: 80.0,
          height: kDrawerHeight,
          child: Center(child: Icon(Icons.format_align_left, size: 35.0)),
          decoration: BoxDecoration(
      color: kPrimaryColor,
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(13.0)),
          ),
        ),
    );
  }
}
