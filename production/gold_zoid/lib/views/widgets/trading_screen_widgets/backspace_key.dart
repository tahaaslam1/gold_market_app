import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';

class BackspaceKey extends StatelessWidget {
  const BackspaceKey({this.onBackspace});
  final VoidCallback onBackspace;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(45),
      onTap: () {
        onBackspace?.call();
      },
      child: Container(
        alignment: Alignment.center,
        width: 35,
        height: 35,
        child: Center(
          child: Icon(
            Icons.backspace,
            color: kPrimaryTextColor,
            ),
        ),
      ),
    );
  }
}
