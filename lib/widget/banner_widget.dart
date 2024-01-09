// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_controller.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shoopping_hub/controllers/banners_controller.dart';
//
// class BannerWidget extends StatefulWidget {
//   const BannerWidget({super.key});
//
//   @override
//   State<BannerWidget> createState() => _BannerWidgetState();
// }
//
// class _BannerWidgetState extends State<BannerWidget> {
//   final CarouselController carouselController = CarouselController();
//   final BannerController _bannerController = Get.put(BannerController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Obx(() {
//         return CarouselSlider(
//           items: _bannerController.bannerUrls
//               .map(
//                 (imageUrls) => ClipRRect(
//                   borderRadius: BorderRadius.circular(10.0),
//                   child: CachedNetworkImage(
//                     imageUrl: imageUrls,
//                     fit: BoxFit.cover,
//                     width: Get.width - 10,
//                     placeholder: (context, url) => const ColoredBox(
//                       color: Colors.white,
//                       child: Center(
//                         child: CupertinoActivityIndicator(),
//                       ),
//                     ),
//                     errorWidget: (context,url,error) => Icon(Icons.error),
//                   ),
//                 ),
//               )
//               .toList(),
//           options: CarouselOptions(
//             scrollDirection: Axis.horizontal,
//             autoPlay: true,
//             aspectRatio: 2.5,
//             viewportFraction: 1,
//           ),
//         );
//       }),
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoopping_hub/controllers/banners_controller.dart';

import '../utils/app_constant.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final CarouselController carouselController = CarouselController();
  final BannerController _bannerController = Get.put(BannerController());
  int _currentPage = 0; // Track the current page index

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: _bannerController.bannerUrls
              .map(
                (imageUrls) => ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: CachedNetworkImage(
                imageUrl: imageUrls,
                fit: BoxFit.cover,
                width: Get.width - 10,
                placeholder: (context, url) => const ColoredBox(
                  color: Colors.white,
                  child: Center(
                    child: CupertinoActivityIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          )
              .toList(),
          options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            autoPlay: true,
            aspectRatio: 2.5,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentPage = index; // Update the current page index
              });
            },
          ),
          carouselController: carouselController,
        ),
        SizedBox(
          height: Get.height / 40,
        ),
        // Indicator row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _bannerController.bannerUrls.length,
                (index) => Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 6,
                width: _currentPage == index ? 30 : 10,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? AppConstant.appScendoryColor
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
