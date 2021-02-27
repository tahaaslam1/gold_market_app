import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';

class ProfilePicture extends StatelessWidget {
  
  final String image; 

  ProfilePicture({@required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 170.0,
          width: 170.0,
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(image),
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
    );
  }
}

