import 'package:ecommers/View/Home_Screen/Home_Category_Details.dart';
import 'package:ecommers/core/view_model/Home_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListViewCategories extends StatelessWidget {
  const ListViewCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 150,
      child: GetBuilder<HomeViewModel>(
        builder: (controller) => ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categoryModel.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Get.to(HomeCategoryDetails(
                  name: controller.categoryModel[index].name!,
                ));
              },
              child: Column(children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade100),
                  height: 60,
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                        (controller.categoryModel[index].image!) ?? 'ff'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text((controller.categoryModel[index].name!) ?? 'ffd')
              ]),
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
