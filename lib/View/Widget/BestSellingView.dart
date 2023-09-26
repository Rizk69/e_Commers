import 'package:ecommers/core/view_model/Home_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance.dart';
import '../Home_Screen/Home_BestSelling_Details.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: GetBuilder<HomeViewModel>(
        builder: (controller) => ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.productModel.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Get.to(HomeBestSellingDetails(
                  model: controller.productModel[index],
                ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.network(
                        controller.productModel[index].image!,
                        height: 250,
                        width: 200,
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      controller.productModel[index].name!,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      controller.productModel[index].description!,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      ' \$ ${controller.productModel[index].price!}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: primaryColor),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }
}
