import 'package:flutter/material.dart';
import 'text_key.dart';


class CustomKeyboard extends StatelessWidget {
  CustomKeyboard({ this.onTextInput,  this.onBackspace });
  
  final ValueSetter<String> onTextInput;
  final VoidCallback onBackspace;
  void _textInputHandler(String text) => onTextInput?.call(text);
  void _backspaceHandler() => onBackspace?.call();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      color: Colors.blue,
      child: Column(        // <-- Column
        children: [
          buildRowOne(),    // <-- Row
          buildRowTwo(),    // <-- Row
          buildRowThree(),  // <-- Row
        ],
      ),
    );
  }
  Expanded buildRowOne() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: '1',
            onTextInput: _textInputHandler,
            qalar: Colors.grey,
          ),
          TextKey(
            qalar: Colors.blue,
            text: '2',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            qalar: Colors.red,
            text: '3',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }
  Expanded buildRowTwo() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            qalar: Colors.blue,
            text: '4',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            qalar: Colors.red,
            text: '5',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            qalar: Colors.grey,
            text: '6',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }
  Expanded buildRowThree() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: '7',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '8',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '9',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }
}