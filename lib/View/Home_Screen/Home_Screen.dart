import 'package:ecommers/View/Widget/BestSellingView.dart';
import 'package:ecommers/View/Widget/ListViewCategories.dart';
import 'package:ecommers/constance.dart';
import 'package:ecommers/core/view_model/Home_View_Model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/login_screen.dart';

class HomeScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
        child: SingleChildScrollView(
          child: GetBuilder<HomeViewModel>(
            builder: (controller) => controller.loading.value
                ? const Center(
                    child: CircularProgressIndicator(
                    color: primaryColor,
                  ))
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade200),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search, color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Categories',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const ListViewCategories(),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Best Selling',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            'See all',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const BestSellingView(),
                      FloatingActionButton(
                        onPressed: () {
                          _auth.signOut();
                          if (_auth.currentUser?.email == null) {
                            Get.offAll(() => LoginScreen());
                          }
                        },
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
