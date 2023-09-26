import 'package:ecommers/View/Control_View.dart';
import 'package:ecommers/constance.dart';
import 'package:ecommers/model/Product_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBestSellingDetails extends StatelessWidget {
  final ProductModel? model;

  const HomeBestSellingDetails({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Image.network(
                model!.image!,
                fit: BoxFit.fill,
                height: 300,
                width: MediaQuery.of(context).size.width,
              ),
              Positioned(
                  left: 20,
                  right: 20,
                  top: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.to(() => const ControlView());
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: const Center(
                          child: Icon(Icons.star_border_outlined,
                              color: Colors.black, size: 25),
                        ),
                      )
                    ],
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  model!.name!,
                  style: GoogleFonts.aBeeZee(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 160,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Size :",
                            style: GoogleFonts.aBeeZee(
                                fontSize: 16, color: Colors.black),
                          ),
                          Text(
                            model!.size!,
                            style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 160,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Colour :",
                            style: GoogleFonts.aBeeZee(
                                fontSize: 16, color: Colors.black),
                          ),
                          Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: model!.color!),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Text(
                  'Details',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.aBeeZee(
                      fontSize: 19, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  model!.description!,
                  style: GoogleFonts.aBeeZee(
                      fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const Spacer(),
          Container(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
            width: MediaQuery.of(context).size.width,
            height: 86,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Price',
                      style: GoogleFonts.aBeeZee(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w200),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      ' \$ ${model!.price!}',
                      style: GoogleFonts.aBeeZee(
                          fontSize: 18,
                          color: primaryColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Container(
                  height: 50,
                  width: 149,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                      child: Text(
                    'ADD',
                    style: GoogleFonts.aBeeZee(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
