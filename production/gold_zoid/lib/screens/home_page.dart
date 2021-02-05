import 'package:flutter/material.dart';

class Home_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gold Zoid'),
      ),
      body: Center(
        child: Container(
          child: Text('this is my app'),
        ),
      ),
    );
  }
}
