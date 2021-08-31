import 'package:flutter/material.dart';
import 'text_key.dart';
import 'package:gold_zoid/views/widgets/trading_screen_widgets/backspace_key.dart';

class CustomKeyboard extends StatelessWidget {
  CustomKeyboard({ this.onTextInput,  this.onBackspace });
  
  final ValueSetter<String> onTextInput;
  final VoidCallback onBackspace;
  void _textInputHandler(String text) => onTextInput?.call(text);
  void _backspaceHandler() => onBackspace?.call();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 0, right: 0, top:10,bottom: 5),
      alignment: Alignment.center,
      //color: Colors.black,
      child: Column(        // <-- Column
        children: <Widget> [
          buildRowOne(),    // <-- Row
          buildRowTwo(),    // <-- Row
          buildRowThree(),  // <-- Row
          buildRowFour(),
        ],
      ),
    );
  }
  ButtonBar buildRowOne() {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceAround, 
        children: <Widget> [
          TextKey(
            text: '1',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '2',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '3',
            onTextInput: _textInputHandler,
          ),
        ],
      
    );
  }
  ButtonBar buildRowTwo() {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceAround,
        children: [
          TextKey(
            text: '4',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '5',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '6',
            onTextInput: _textInputHandler,
          ),
        ],
    );
  }
  ButtonBar buildRowThree() {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceAround,
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
      
    );
  }
  ButtonBar buildRowFour(){
    return ButtonBar(
      alignment: MainAxisAlignment.spaceAround,
      children: <Widget> [
        TextKey(
            text: ' ',
            onTextInput: null,
          ), 
         TextKey(
            text: '0',
            onTextInput: _textInputHandler,
          ),
           BackspaceKey(
            onBackspace: _backspaceHandler,
          ),
      ], 
    ); 
  }
}
