import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoopping_hub/screens/user_panel/all_categories_screen.dart';
import 'package:shoopping_hub/screens/user_panel/all_flash_sale_product.dart';
import 'package:shoopping_hub/screens/user_panel/all_product_screen.dart';
import 'package:shoopping_hub/screens/user_panel/cart_screen.dart';
import 'package:shoopping_hub/utils/app_constant.dart';
import 'package:shoopping_hub/widget/all_product_widget.dart';
import 'package:shoopping_hub/widget/banner_widget.dart';
import 'package:shoopping_hub/widget/category_widget.dart';
import 'package:shoopping_hub/widget/custom_drawer_widget.dart';
import 'package:shoopping_hub/widget/flash_sale_widget.dart';
import 'package:shoopping_hub/widget/heading_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppConstant.appTextColor),
        backgroundColor: AppConstant.appMainColor,
        title: Text(
          AppConstant.appMainName,
          style: const TextStyle(
              fontWeight: FontWeight.w500, color: AppConstant.appTextColor),
        ),
        centerTitle: true,
        actions: [GestureDetector(
          onTap: (() => Get.to(() => CartScreen())),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.shopping_cart),
          ),
        )],
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: Get.height / 90,
              ),
              //banners
              BannerWidget(),

              // todo heading
              HeadingWidget(
                headingTitle: "Categories",
                headingSubTitle: "According to your budget",
                onTap: () => Get.to(() => AllCategoriesScreen()),
                buttonText: "See More >",
              ),
              CategoriesWidget(),

              HeadingWidget(
                headingTitle: "Flash Sale",
                headingSubTitle: "According to your budget",
                onTap: () => Get.to(() => AllFlashSaleProductScreen()),
                buttonText: "See More >",
              ),
              FlashSaleWidget(),

              HeadingWidget(
                headingTitle: "All Products",
                headingSubTitle: "According to your budget",
                onTap: ()  => Get.to(() => AllProductsScreen()),
                buttonText: "See More >",
              ),

              AllProductsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
