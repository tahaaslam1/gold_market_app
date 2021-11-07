import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/views/widgets/drawer/custom_drawer_header.dart';
import 'package:gold_zoid/views/widgets/drawer/custom_list_tile.dart';

//TODO: sahi icons dhood k daalne hein

class CustomDrawer extends StatelessWidget {
  final Function onTap;
  CustomDrawer({@required this.onTap});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Material(
          color: kTitleIconColor,
          child: ListView(
            children: [
              CustomDrawerHeader(onTap: onTap),
              CustomListTile(
                onTap: () => selectedItem(context, 0),
                titleText: 'Home',
                leadingIcon: Icons.home,
              ),
              kGreyDivider,
              CustomListTile(
                onTap: () => selectedItem(context, 1),
                titleText: 'My Inventory',
                leadingIcon: Icons.inventory,
              ),
              kGreyDivider,
              CustomListTile(
                onTap: () => selectedItem(context, 2),
                titleText: 'My Account',
                leadingIcon: Icons.person_outline,
              ),
              kGreyDivider,
              CustomListTile(
                onTap: () => selectedItem(context, 3),
                titleText: 'Buy / Sell',
                leadingIcon: Icons.attach_money_rounded,
              ),
              kGreyDivider,
              CustomListTile(
                onTap: () => selectedItem(context, 4),
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

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.popAndPushNamed(context, '/homeScreen');
        break;
      case 1:
        Navigator.popAndPushNamed(context, '/inventoryScreen');
        break;
      case 2:
        Navigator.popAndPushNamed(context, '/accountScreen');
        break;
      case 3:
        Navigator.popAndPushNamed(context, '/tradingScreen');
        break;
    }
  }
}
