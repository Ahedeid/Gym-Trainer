// import 'package:flutter/material.dart';
// import 'package:shop_app/sheared/skeletonWidget/baseShimmerWidget.dart';
// import 'package:shop_app/utils/resources/colors_manger.dart';
// import 'package:shop_app/utils/resources/sizes_in_app.dart';
//
// class ListProductShimmerWidget extends StatelessWidget {
//   const ListProductShimmerWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return ListView.builder(
//       padding: EdgeInsets.symmetric(
//         horizontal: AppSizes.paddingHorizontal,
//         vertical: AppSizes.paddingVertical,
//       ),
//       itemCount: 10,
//       physics: BouncingScrollPhysics(),
//       itemBuilder: (context, index) => Container(
//         padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
//         margin: EdgeInsets.only(bottom: 15),
//         decoration: BoxDecoration(
//           color: ColorManager.white,
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Row(
//           children: [
//             Container(
//               width: 90,
//               height: 90,
//               padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: ColorManager.grayLite),
//               // child: Skeleton()
//             ),
//             SizedBox(width: 10),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 10),
//                   Skeleton(
//                     width: size.width * 0.5,
//                   ),
//                   SizedBox(height: 8),
//                   Skeleton(
//                     width: size.width * 0.3,
//                   ),
//                   SizedBox(height: 10),
//                   Skeleton(
//                     width: size.width * 0.2,
//                   ),
//                   SizedBox(height: 20),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
