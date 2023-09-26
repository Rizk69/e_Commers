import 'package:ecommers/View/Control_View.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCategoryDetails extends StatelessWidget {
  final String name;

  const HomeCategoryDetails({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
              size: 18,
            ),
            onPressed: () {
              Get.to(const ControlView());
            }),
        centerTitle: true,
        title: Text(
          name,
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
