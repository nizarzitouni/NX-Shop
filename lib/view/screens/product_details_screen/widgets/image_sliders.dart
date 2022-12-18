import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/core/my_colors.dart';
import 'package:nx_shop/core/routes/app_routes.dart';
import 'package:nx_shop/view/screens/product_details_screen/widgets/color_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../controllers/main/cart_controller.dart';
import '../../../../core/size_config.dart';
import '../../../../core/utility.dart';

class ImageSliders extends StatefulWidget {
  ImageSliders({
    // required this.imageUrl,
    Key? key,
    required this.imageList,
  }) : super(key: key);

  final List<String> imageList;
  @override
  _ImageSlidersState createState() => _ImageSlidersState();
}

class _ImageSlidersState extends State<ImageSliders> {
  CarouselController carouselController = CarouselController();

  final cartController = Get.find<CartController>();

  final List<Color> colorSelected = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
    kCOlor2,
    kCOlor3,
    kCOlor4,
  ];
  int currentPage = 0;
  int currentColor = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: [
        //###########Image list
        CarouselSlider.builder(
          itemCount: widget.imageList.length,
          carouselController: carouselController,
          options: CarouselOptions(
              height: 500,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlayInterval: const Duration(seconds: 2),
              viewportFraction: 1,
              onPageChanged: (index, reson) {
                setState(() {
                  currentPage = index;
                });
              }),
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                // image: DecorationImage(
                //   image: NetworkImage(widget.imageList[index]),
                //   fit: BoxFit.fill,
                // ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Utility.imageFromBase64String(
                base64String: widget.imageList[index],
                imageHeight: SizeConfig.screenHeight * .6,
                imageWidth: SizeConfig.screenWidth,
              ),
            );
          },
        ),
        //###########indicator
        Positioned(
          bottom: 30,
          left: 180,
          child: AnimatedSmoothIndicator(
            activeIndex: currentPage,
            count: widget.imageList.length,
            effect: ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor:
                  Get.isDarkMode ? MyColors.myPink : MyColors.myYellow,
              dotColor: Colors.black,
            ),
          ),
        ),
        //######Vertical Colors
        Positioned(
          bottom: 30,
          right: 30,
          child: Container(
            height: 200,
            width: 50,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentColor = index;
                    });
                  },
                  child: ColorPicker(
                    color: colorSelected[index],
                    outerBorder: currentColor == index,
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 3),
              itemCount: colorSelected.length,
            ),
          ),
        ),
        //###########Badge Row
        Container(
          padding: const EdgeInsets.only(
            top: 20,
            left: 25,
            right: 25,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? MyColors.myPink.withOpacity(0.8)
                        : MyColors.myYellow.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              Obx(
                () => Badge(
                  position: BadgePosition.topEnd(top: -10, end: -10),
                  animationDuration: const Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent: Text(
                    cartController.quantity().toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.CARTSCREEN);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? MyColors.myPink.withOpacity(0.8)
                            : MyColors.myYellow.withOpacity(0.8),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
