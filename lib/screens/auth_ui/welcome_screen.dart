// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
// import 'package:shoopping_hub/controllers/google_sign_in_controllers.dart';
// import 'package:shoopping_hub/utils/app_constant.dart';
//
// class WelcomeScreen extends StatefulWidget {
//    WelcomeScreen({super.key});
//
//    final GoogleSignInController _googleSignInController =
//    Get.put(GoogleSignInController());
//
//   @override
//   State<WelcomeScreen> createState() => _WelcomeScreenState();
// }
//
// class _WelcomeScreenState extends State<WelcomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         centerTitle: true,
//         backgroundColor: AppConstant.appScendoryColor,
//         title: Text(
//           'Welcome to shopping hub',
//           style: TextStyle(color: AppConstant.appTextColor),
//         ),
//       ),
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               child: Lottie.asset('assets/images/splash-icon.json'),
//             ),
//             Container(
//                 margin: EdgeInsets.only(top: 20.0),
//                 child: Text(
//                   'Happy Shopping',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 )),
//             SizedBox(
//               height: Get.height / 12,
//             ),
//             Material(
//               child: Container(
//                 width: Get.width / 1.2,
//                 height: Get.height / 12,
//                 decoration: BoxDecoration(
//                     color: AppConstant.appScendoryColor,
//                     borderRadius: BorderRadius.circular(20)),
//                 child: TextButton.icon(
//                   icon: Image.asset(
//                     'assets/images/final-google-logo.png',
//                     width: Get.width / 12,
//                     height: Get.height / 12,
//                   ),
//                   label: Text(
//                     'Sign in with google',
//                     style: TextStyle(color: AppConstant.appTextColor),
//                   ),
//                   onPressed: () {
//                     _googleSignInController.signInWithGoogle();
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: Get.height / 50,
//             ),
//             Material(
//               child: Container(
//                 width: Get.width / 1.2,
//                 height: Get.height / 12,
//                 decoration: BoxDecoration(
//                     color: AppConstant.appScendoryColor,
//                     borderRadius: BorderRadius.circular(20)),
//                 child: TextButton.icon(
//                   icon: Image.asset(
//                     'assets/images/gmail.png',
//                     width: Get.width / 12,
//                     height: Get.height / 12,
//                   ),
//                   label: Text(
//                     'Sign in with email',
//                     style: TextStyle(color: AppConstant.appTextColor),
//                   ),
//                   onPressed: () {},
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/google_sign_in_controllers.dart';
import '../../utils/app_constant.dart';
import 'sign_in_screen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final GoogleSignInController _googleSignInController =
  Get.put(GoogleSignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppConstant.appScendoryColor,
        title: const Text(
          "Welcome to shopping hub",
          style: TextStyle(color: AppConstant.appTextColor),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Lottie.asset('assets/images/splash-icon.json'),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: const Text(
                "Happy Shopping",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: Get.height / 12,
            ),
            Material(
              child: Container(
                width: Get.width / 1.2,
                height: Get.height / 12,
                decoration: BoxDecoration(
                  color: AppConstant.appScendoryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextButton.icon(
                  icon: Image.asset(
                    'assets/images/final-google-logo.png',
                    width: Get.width / 12,
                    height: Get.height / 12,
                  ),
                  label: const Text(
                    "Sign in with google",
                    style: TextStyle(color: AppConstant.appTextColor),
                  ),
                  onPressed: () {
                    _googleSignInController.signInWithGoogle();
                  },
                ),
              ),
            ),
            SizedBox(
              height: Get.height / 50,
            ),
            Material(
              child: Container(
                width: Get.width / 1.2,
                height: Get.height / 12,
                decoration: BoxDecoration(
                  color: AppConstant.appScendoryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextButton.icon(
                    icon: Image.asset(
                    'assets/images/gmail.png',
                    width: Get.width / 12,
                    height: Get.height / 12,
                  ),
                  label: const Text(
                    "Sign in with email",
                    style: TextStyle(color: AppConstant.appTextColor),
                  ),
                  onPressed: () {
                    Get.to(() => const SignInScreen());
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
