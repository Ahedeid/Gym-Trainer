// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:shop_app/routes/app_router.dart';
// import 'package:shop_app/routes/router_generator.dart';
// import 'package:shop_app/routes/screen_name.dart';
// import 'package:shop_app/utils/resources/colors_manger.dart';
// import 'package:shop_app/utils/resources/font_size.dart';
//
// class listCategoryWidget extends StatelessWidget {
//   const listCategoryWidget({
//     super.key,
//     required this.name,
//     required this.id,
//     required this.image,
//     required this.item,
//   });
//
//   final int id;
//   final String name;
//   final String image;
//   final String item;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         AppRouter.goTo(
//             object: ScreenArguments(title: name, id: id),
//             screenName: ScreenName.categoryDetailsScreen);
//       },
//       child: Container(
//         margin: EdgeInsets.all(8),
//         padding: EdgeInsets.all(15),
//         decoration: BoxDecoration(boxShadow: [
//           BoxShadow(
//             color: Color(0xFF41413824),
//             blurRadius: 7,
//             offset: Offset(0, 8),
//           ) // chan
//         ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 100,
//               width: 100,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(6),
//                 child: CachedNetworkImage(
//                     placeholder: (context, url) =>
//                         Center(child: const CircularProgressIndicator()),
//                     imageUrl: image),
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               name,
//               softWrap: true,
//               maxLines: 1,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: FontSize.s15,
//                 overflow: TextOverflow.clip,
//                 color: ColorManager.primaryTextColor,
//               ),
//             ),
//             SizedBox(height: 8),
//             Expanded(
//               child: Text(
//                 item,
//                 softWrap: true,
//                 maxLines: 1,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: FontSize.s11,
//                   overflow: TextOverflow.clip,
//                   color: ColorManager.gray,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
