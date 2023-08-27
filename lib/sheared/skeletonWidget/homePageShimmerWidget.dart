// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:shop_app/sheared/skeletonWidget/baseShimmerWidget.dart';
// import 'package:shop_app/utils/resources/colors_manger.dart';
// import 'package:shop_app/utils/resources/sizes_in_app.dart';
//
// class homeScreenShimmerWidget extends StatelessWidget {
//   const homeScreenShimmerWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Padding(
//       padding: EdgeInsets.symmetric(
//         horizontal: AppSizes.paddingHorizontal,
//         vertical: AppSizes.paddingVertical,
//       ),
//       child: ListView(
//         physics: BouncingScrollPhysics(),
//         children: [
//           Skeleton(
//             height: size.height * 0.05,
//           ),
//           SizedBox(height: 25),
//           CarouselSlider.builder(
//             itemCount: 4,
//             itemBuilder:
//                 (BuildContext context, int itemIndex, int pageViewIndex) =>
//                     Skeleton(),
//             options: CarouselOptions(
//               aspectRatio: 2.0,
//               viewportFraction: 1,
//               initialPage: 0,
//               enableInfiniteScroll: true,
//               reverse: false,
//               autoPlay: true,
//               autoPlayInterval: Duration(seconds: 20),
//               autoPlayAnimationDuration: Duration(seconds: 4),
//               autoPlayCurve: Curves.easeIn,
//               enlargeCenterPage: true,
//               enlargeFactor: 0.3,
//             ),
//           ),
//           SizedBox(height: 15),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Skeleton(
//                 width: size.width * 0.4,
//               ),
//               Skeleton(
//                 width: size.width * 0.2,
//               )
//             ],
//           ),
//           SizedBox(
//             height: 200,
//             width: double.infinity,
//             child: ListView.builder(
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               itemCount: 5,
//               itemBuilder: (context, index) => Container(
//                 margin: EdgeInsets.all(8),
//                 padding: EdgeInsets.all(15),
//                 decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Color(0xFF41413824),
//                         blurRadius: 7,
//                         offset: Offset(0, 8),
//                       ) // chan
//                     ],
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(15)),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                         height: 100,
//                         width: 100,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(6),
//                           child: Skeleton(),
//                         )),
//                     SizedBox(height: 10),
//                     Skeleton(
//                       width: size.width * 0.3,
//                     ),
//                     SizedBox(height: 8),
//                     Expanded(
//                       child: Skeleton(
//                         width: size.width * 0.15,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Skeleton(
//                 width: size.width * 0.4,
//               ),
//               Skeleton(
//                 width: size.width * 0.2,
//               )
//             ],
//           ),
//           SizedBox(height: 10),
//           GridView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: 10,
//               gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                   maxCrossAxisExtent: 250,
//                   mainAxisExtent: 250,
//                   childAspectRatio: 3 / 2,
//                   crossAxisSpacing: 15,
//                   mainAxisSpacing: 15),
//               itemBuilder: (context, index) {
//                 return Container(
//                   padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color(0xFF41413824),
//                           blurRadius: 7,
//                           offset: Offset(0, 8),
//                         ) // chan
//                       ],
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(15)),
//                   child: Column(
//                     children: [
//                       Align(
//                           alignment: Alignment.topRight,
//                           child: CircleSkeleton()),
//                       SizedBox(height: 3),
//                       SizedBox(
//                         height: 110,
//                         width: 110,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(6),
//                           child: Skeleton(),
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       Skeleton(
//                         width: size.width * 0.3,
//                       ),
//                       SizedBox(height: 8),
//                       Skeleton(
//                         width: size.width * 0.2,
//                       ),
//                       SizedBox(height: 4),
//                       Skeleton(
//                         width: size.width * 0.15,
//                       ),
//                     ],
//                   ),
//                 );
//               })
//         ],
//       ),
//     );
//   }
// }
//
// class OneSkeleton extends StatelessWidget {
//   const OneSkeleton({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Shimmer.fromColors(
//       baseColor: Colors.grey.shade400,
//       highlightColor: ColorManager.white,
//       child: Skeleton(width: size.width * 0.3),
//     );
//   }
// }
