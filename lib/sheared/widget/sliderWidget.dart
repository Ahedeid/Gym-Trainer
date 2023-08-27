// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:shop_app/feature/home/model/homeModel.dart';
//
// class sliderWidget extends StatelessWidget {
//   const sliderWidget(
//       {super.key, required this.itemCount, required this.images});
//
//   final int itemCount;
//   final List<Banners> images;
//
//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider.builder(
//       itemCount: itemCount,
//       itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
//           ClipRRect(
//         borderRadius: BorderRadius.circular(6),
//         child: CachedNetworkImage(imageUrl: images[itemIndex].image),
//       ),
//       options: CarouselOptions(
//         aspectRatio: 2.0,
//         viewportFraction: 1,
//         initialPage: 0,
//         enableInfiniteScroll: true,
//         reverse: false,
//         autoPlay: true,
//         autoPlayInterval: Duration(seconds: 20),
//         autoPlayAnimationDuration: Duration(seconds: 4),
//         autoPlayCurve: Curves.easeIn,
//         enlargeCenterPage: true,
//         enlargeFactor: 0.3,
//       ),
//     );
//   }
// }
