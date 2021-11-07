import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/views/widgets/drawer/custom_drawer_header.dart';
import 'package:gold_zoid/views/widgets/drawer/custom_list_tile.dart';

//TODO: sahi icons dhood k daalne hein

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: kTitleIconColor,
          child: ListView(
            children: [
              CustomDrawerHeader(),
              CustomListTile(
                titleText: 'Home',
                leadingIcon: Icons.home,
              ),
              kGreyDivider,
              CustomListTile(
                titleText: 'My Inventory',
                leadingIcon: Icons.inventory,
              ),
              kGreyDivider,
              CustomListTile(
                titleText: 'My Account',
                leadingIcon : Icons.person_outline,
              ),
              kGreyDivider,
              CustomListTile(
                titleText: 'Buy / Sell',
                leadingIcon: Icons.attach_money_rounded,
              ),
              kGreyDivider,
              CustomListTile(
                titleText: 'F.a.q & Helps',
                leadingIcon: Icons.help_outline,
              ),
              kGreyDivider,
              SizedBox(
                height: 100.0,
              ), //TODO: responsiveness check
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: InkWell(
                  onTap: () {
                    print(
                        'logout of application'); //TODO: logout functionality..
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 21,
                      color: kInventoryBoxColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
