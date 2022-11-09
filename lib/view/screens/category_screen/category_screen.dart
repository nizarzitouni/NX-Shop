import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/view/global_widgets/my_text.dart';
import 'package:nx_shop/view/screens/category_screen/widgets/category_list.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, top: 15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 15),
                child: MyText(
                  myColor: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  text: "Category",
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CategoryList(),
          ],
        ),
      ),
    );
  }
}
