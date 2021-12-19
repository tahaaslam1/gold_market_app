import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/controllers/validation_logic.dart';
import 'package:gold_zoid/views/titles/common_title.dart';
import 'package:gold_zoid/views/widgets/accountScreenWidgets/edit_name_or_number.dart';
import 'package:gold_zoid/views/widgets/accountScreenWidgets/profile_picture.dart';
import 'package:gold_zoid/views/widgets/drawer/custom_drawer.dart';
import 'package:gold_zoid/controllers/user_login_signup_controller.dart';
import 'package:provider/provider.dart';
import 'package:gold_zoid/controllers/user_controller.dart';
import 'package:image_picker/image_picker.dart';

class Account_Page extends StatefulWidget {
  @override
  State<Account_Page> createState() => _Account_PageState();
}

class _Account_PageState extends State<Account_Page> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ImagePicker _picker = ImagePicker();
  File _pickedImage;
  File _userOwnImage;

  @override
  void initState() {
    super.initState();
    print('in init');
        var test = Provider.of<UserController>(context,listen: false).getLoggedInUser.profileUrl;
    if (Provider.of<UserController>(context, listen: false)
            .getLoggedInUser
            .profileUrl !=
        'https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-alt-512.png') {
      setState(() {
        _userOwnImage = 
            File(Provider.of<UserController>(context,listen:false).getLoggedInUser.profileUrl);
      });
    }
  }

  Future _pickImage() async {
    var pickedImagePath = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
      maxWidth: 270,
    );
    print('selected picture: ${pickedImagePath}');

    setState(() {
      _pickedImage = File(pickedImagePath.path);
    });

    context.read<UserController>().editUserProfileUrl(_pickedImage.toString());
    // passing path of picked file
  }

  void _failSnackbar(String error) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        error,
        textAlign: TextAlign.center,
        style: TextStyle(),
      ),
    );
    //_scaffoldKey.currentState.showSnackBar(snackBar);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

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
                // image: _pickedImage != null
                //     ? FileImage(_pickedImage)
                //     : context
                //                 .read<UserController>()
                //                 .getLoggedInUser
                //                 .profileUrl ==
                //             'https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-alt-512.png'
                //         ? NetworkImage(context
                //             .watch<UserController>()
                //             .getLoggedInUser
                //             .profileUrl)
                //         : FileImage(_userOwnImage),
image: _pickedImage != null
                    ? FileImage(_pickedImage)
                    : _userOwnImage != null
                        ? FileImage(_userOwnImage)
                        : NetworkImage(context
                             .watch<UserController>()
                             .getLoggedInUser
                             .profileUrl),
                ////image :
                ////image: context.read<UserController>().getLoggedInUser.profileUrl == 'https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-alt-512.png' ? NetworkImage('${context.watch<UserController>().getLoggedInUser.profileUrl}') : FileImage('${context.watch<UserController>().getLoggedInUser.profileUrl}'),
                // image: _pickedImage != null
                //     ? FileImage(_pickedImage)
                //     : context
                //                 .read<UserController>()
                //                 .getLoggedInUser
                //                 .profileUrl ==
                //             'https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-alt-512.png'
                //         ? NetworkImage(
                //             '${context.read<UserController>().getLoggedInUser.profileUrl}')
                //         : FileImage(_userOwnImage),
                // //'${context.watch<UserController>().getLoggedInUser.profileUrl}', //TODO: display users picture
                onClicked: () async {
                  await _pickImage();
                },
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
                attribute:
                    '${context.watch<UserController>().getLoggedInUser.name}',
                onTap: () {
                  _showEditNameBottomSheet(context);
                },
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
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Text(
                        'Cannot Update Email Address at the moment',
                        textAlign: TextAlign.center,
                        style: TextStyle(),
                      ),
                    ),
                  );
                  //TODO: email edit krne k liye gmail se connection krna parega..
                  //_showEditEmailBottomSheet(context);
                },
                icon: Icon(
                  Icons.email_outlined,
                  size: 40.0,
                  color: kPrimaryColor,
                ),
                type: 'Email Address',
                attribute:
                    '${context.watch<UserController>().getLoggedInUser.emailId}',
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

void _showEditNameBottomSheet(BuildContext context) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
    ),
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return editNameBottomSheetMenu(
          context); //Wrap(children: [editNameBottomSheetMenu()]);
    },
  );
}

Container editNameBottomSheetMenu(BuildContext context) {
  TextEditingController _nameController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var validate = ValidationLogic();
  return Container(
    height: 00.0,
    child: Column(
      //mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 20.0),
              child: Text(
                'Edit your name',
                style: TextStyle(
                  color: kSecondaryTextColor,
                  fontSize: 17.0,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15.0,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: TextFormField(
            validator: validate.validateName,
            controller: _nameController,
            cursorHeight: 20.0,
            cursorColor: kPrimaryColor,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kPrimaryTextColor,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kPrimaryColor,
                ),
              ),
              hintText:
                  '${context.watch<UserController>().getLoggedInUser.name}',
              hintStyle: TextStyle(
                fontSize: 15.0,
                color: kPrimaryTextColor,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25.0,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  //close bottom sheet
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(color: kPrimaryColor, fontSize: 15.0),
                ),
              ),
              SizedBox(width: 20.0),
              InkWell(
                onTap: () {
                  //check user name if same so direct close..
                  if (context
                          .read<UserController>()
                          .editUserName(newUserName: _nameController.text) ==
                      'User Name Not Updated') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          'Couldnt Update your name',
                          textAlign: TextAlign.center,
                          style: TextStyle(),
                        ),
                      ),
                    );
                  }
                  if (context
                          .read<UserController>()
                          .editUserName(newUserName: _nameController.text) ==
                      'Text Field should not be empty') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          'Text Field should not be empty',
                          textAlign: TextAlign.center,
                          style: TextStyle(),
                        ),
                      ),
                    );
                  }
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Save',
                  style: TextStyle(color: kPrimaryColor, fontSize: 15.0),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

// void _showEditEmailBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(10.0),
//         topRight: Radius.circular(10.0),
//       ),
//     ),
//     isScrollControlled: true,
//     context: context,
//     builder: (BuildContext context) {
//       return editEmailBottomSheetMenu(
//           context); //Wrap(children: [editNameBottomSheetMenu()]);
//     },
//   );
// }

// Container editEmailBottomSheetMenu(BuildContext context) {
//   TextEditingController _emailontroller = TextEditingController();
//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   var validate = ValidationLogic();
//   return Container(
//     height: 400.0,
//     child: Column(
//       //mainAxisSize: MainAxisSize.min,
//       children: [
//         Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 15.0, top: 20.0),
//               child: Text(
//                 'Edit your email address',
//                 style: TextStyle(
//                   color: kSecondaryTextColor,
//                   fontSize: 17.0,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 15.0,
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: 15.0),
//           child: TextFormField(
//             validator: validate.validateName,
//             controller: _nameController,
//             cursorHeight: 20.0,
//             cursorColor: kPrimaryColor,
//             keyboardType: TextInputType.name,
//             decoration: InputDecoration(
//               disabledBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(
//                   color: kPrimaryTextColor,
//                 ),
//               ),
//               focusedBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(
//                   color: kPrimaryColor,
//                 ),
//               ),
//               hintText:
//                   '${context.watch<UserController>().getLoggedInUser.name}',
//               hintStyle: TextStyle(
//                 fontSize: 15.0,
//                 color: kPrimaryTextColor,
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 25.0,
//         ),
//         Padding(
//           padding: const EdgeInsets.only(right: 15.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               InkWell(
//                 onTap: () {
//                   Navigator.of(context).pop();
//                   //close bottom sheet
//                 },
//                 child: Text(
//                   'Cancel',
//                   style: TextStyle(color: kPrimaryColor, fontSize: 15.0),
//                 ),
//               ),
//               SizedBox(width: 20.0),
//               InkWell(
//                 onTap: () {
//                   //check user name if same so direct close..
//                   _nameController.text != null
//                       ? context
//                           .read<UserController>()
//                           .editUserName(newUserName: _nameController.text)
//                       :
//                        context
//                           .read<UserController>()
//                           .editUserName(newUserName: 'Named not entered');
//                    Navigator.of(context).pop();
//                 },
//                 child: Text(
//                   'Save',
//                   style: TextStyle(color: kPrimaryColor, fontSize: 15.0),
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     ),
//   );
// }
