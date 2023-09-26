import 'package:flutter/material.dart';

import '../../constance.dart';
import 'CustomText.dart';

class CustomButtom extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButtom({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.all(18),
          foregroundColor: Colors.purple,
          backgroundColor: primaryColor,
        ),
        onPressed: onPressed,
        child: CustomText(
          color: Colors.white,
          text: text,
          fontSize: 17,
          alignment: Alignment.center,
        ));
  }
}
// 'SIGN IN'
