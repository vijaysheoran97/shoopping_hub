import 'package:flutter/material.dart';

import '../../utils/app_constant.dart';
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
        backgroundColor: AppConstant.appMainColor,
        title: Text(
          AppConstant.appMainName,
          style: TextStyle(
              fontWeight: FontWeight.w500, color: AppConstant.appTextColor),
        ),
        centerTitle: true,
      ),
    );
  }
}

