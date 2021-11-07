import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/views/titles/common_title.dart';
import 'package:gold_zoid/views/widgets/accountScreenWidgets/edit_name_or_number.dart';
import 'package:gold_zoid/views/widgets/accountScreenWidgets/profile_picture.dart';
import 'package:gold_zoid/views/widgets/drawer/custom_drawer.dart';

class Account_Page extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(
        onTap: () => Navigator.pop(context),
      ),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CommonTitle(
                onTap: () => _scaffoldKey.currentState.openEndDrawer(),
                mainTitleText: 'My Account',
                sideText: 'manage your account',
                icon: Icon(
                  Icons.person_outline,
                  size: 35.0,
                  color: kTitleIconColor,
                ),
              ),
              SizedBox(height: 10.0),
              ProfilePicture(
                image:
                    'assets/images/testing_profile.jpg', //TODO: display users picture
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
