import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoopping_hub/utils/app_constant.dart';
import 'package:shoopping_hub/widget/banner_widget.dart';
import 'package:shoopping_hub/widget/custom_drawer_widget.dart';

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
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: Get.height / 90.0,
              ),
              //banners
              BannerWidget(),
          ],
          ),

        ),
      ),
    );
  }
}
