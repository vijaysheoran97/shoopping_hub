import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../utils/app_constant.dart';

class GetDeviceTokenController extends GetxController {

  String? deviceToken;

  @override
  void onInit(){
    super.onInit();
    getDeviceToken();
  }

  Future<void> getDeviceToken () async {
    try{
      String? token = await FirebaseMessaging.instance.getToken();

      if(token != null){
        deviceToken = token;
        update();
      }
    }catch(e){
      Get.snackbar(
        "Error",
        "$e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppConstant.appScendoryColor,
        colorText: AppConstant.appTextColor,
      );
    }
  }
}