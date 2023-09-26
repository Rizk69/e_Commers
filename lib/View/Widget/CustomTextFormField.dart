import 'package:flutter/material.dart';

import 'CustomText.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hint;
  final Function(String?)? onSave;
  final FormFieldValidator<String>? validator;

  const CustomTextFormField(
      {super.key,
      required this.hint,
      this.onSave,
      this.validator,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text,
          fontSize: 14,
          color: Colors.black54,
        ),
        TextFormField(
          onSaved: onSave,
          validator: validator,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.black),
              fillColor: Colors.white),
        ),
      ],
    );
  }
}
// 'Email'
// 'iamdavid@gmail.com'
