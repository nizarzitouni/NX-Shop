import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/data/models/product_model.dart';
import 'package:nx_shop/view/screens/product_details_screen/widgets/add_cart.dart';
import 'package:nx_shop/view/screens/product_details_screen/widgets/cloths_info.dart';
import 'package:nx_shop/view/screens/product_details_screen/widgets/image_sliders.dart';
import 'package:nx_shop/view/screens/product_details_screen/widgets/size_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key, required this.productModel})
      : super(key: key);
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliders(
                imageList: productModel.images,
              ),
              ClothesInfo(
                title: productModel.productName,
                productId: productModel.productId,
                rate: productModel.productRating.rate,
                description: productModel.description,
              ),
              const SizeList(),
              AddCart(
                price: productModel.productPrice,
                productModel: productModel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
