import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';

class TextKey extends StatelessWidget {
  
  const TextKey({@required this.text, this.onTextInput});

  final String text;
  final ValueSetter<String> onTextInput;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(45),
        onTap: () {
          print('hu');
          onTextInput?.call(text);
        },
        child: Container(
          width: 35.0,
          height: 35.0,
          alignment: Alignment.center,
          child: Center(  
            child: Text(
               text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kPrimaryTextColor,
                fontSize: 30.0, 
                fontFamily: 'Avenir',
              ),
              )
            ),
        ),
    );
  }
}