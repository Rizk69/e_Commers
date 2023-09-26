import 'package:flutter/material.dart';

import 'CustomText.dart';

class CustomButtomSocial extends StatelessWidget {
  final String text;
  final String imagePath;
  final VoidCallback onPressed;

  const CustomButtomSocial(
      {Key? key,
      required this.text,
      required this.imagePath,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.all(18),
          foregroundColor: Colors.purple,
          backgroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(imagePath, height: 30),
            CustomText(
              color: Colors.black,
              text: text,
              fontSize: 16,
              alignment: Alignment.center,
            ),
          ],
        ));
  }
}
