import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/titles/common_title.dart';

class Account_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CommonTitle(
                mainTitleText: 'My Account',
                sideText: 'manage your account',
                icon: Icon(
                  Icons.person_outline,
                  size: 35.0,
                ),
              ),
              SizedBox(height: 10.0),
              Stack(
                children: [
                  Container(
                    height: 170.0,
                    width: 170.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/testing_profile.jpg'),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 120.0,
                    right: 5.0,
                    bottom: 0.0,
                    child: Container(
                      child: Icon(
                        Icons.camera_alt,
                        size: 25.0,
                        color: Colors.white,
                      ),
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              EditNameOrNumber(
                icon: Icon(
                  Icons.person_outline,
                  size: 40.0,
                  color: kPrimaryColor,
                ),
                type: 'Name',
                attribute: 'Taha Aslam',
              ),
              SizedBox(
                height: 45.0,
              ),
              Divider(
                thickness: 1.0,
                color: kPrimaryColor,
                indent: 80.0,
              ),
              SizedBox(
                height: 45.0,
              ),
              EditNameOrNumber(
                icon: Icon(
                  Icons.phone_outlined,
                  size: 40.0,
                  color: kPrimaryColor,
                ),
                type: 'Phone',
                attribute: '03412369866',
              ),
              SizedBox(
                height: 45.0,
              ),
              Divider(
                thickness: 1.0,
                color: kPrimaryColor,
                indent: 80.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
          child: Icon(
            Icons.edit,
            size: 25.0,
            color: kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
