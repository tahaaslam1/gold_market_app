import 'package:flutter/material.dart';

class TextKey extends StatelessWidget {
  
  const TextKey({@required this.text, this.onTextInput, this.flex = 1,this.qalar});

  final String text;
  final ValueSetter<String> onTextInput;
  final int flex;
  final Color qalar; 
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            onTextInput?.call(text);
          },
          child: Container(
            color: qalar,
            child: Center(
              child: Text(
                text,

                )
              ),
          ),
        ),
      ),
    );
  }
}