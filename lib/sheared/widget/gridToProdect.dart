// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:shop_app/sheared/widgets/CustomeSvg.dart';
// import 'package:shop_app/utils/resources/colors_manger.dart';
// import 'package:shop_app/utils/resources/font_size.dart';
// import 'package:shop_app/utils/resources/icons_constant.dart';
//
//
// class GridToProduct extends StatelessWidget {
//   const GridToProduct({
//     super.key,
//     this.onTap,
//     required this.discount,
//     required this.visible,
//     this.onPressedFav,
//     required this.toggle,
//     required this.imageUrl,
//     required this.name,
//     required this.price,
//     required this.oldPrice,
//   });
//
//   final void Function()? onTap;
//   final String discount;
//   final bool visible;
//   final void Function()? onPressedFav;
//   final bool toggle;
//   final String imageUrl;
//   final String name;
//   final String price;
//   final String oldPrice;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.all(10),
//         decoration: BoxDecoration(boxShadow: [
//           BoxShadow(
//             color: Color(0xFF41413824),
//             blurRadius: 7,
//             offset: Offset(0, 8),
//           ) // chan
//         ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Visibility(
//                   visible: visible,
//                   child: Container(
//                     width: 34,
//                     height: 21,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(4),
//                         color: ColorManager.primary),
//                     child: Center(
//                       child: Text(
//                         discount,
//                         style: TextStyle(
//                           fontSize: FontSize.s11,
//                           color: ColorManager.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                     onPressed: onPressedFav,
//                     icon: toggle
//                     // fav.favoriteList
//                     //         .map((e) => e.product.id)
//                     //         .contains(value.homeModel!
//                     //             .products[index].id)
//                         ? Container(
//                       width: 24,
//                       height: 24,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: ColorManager.primary),
//                       child: CustomSvgAssets(
//                         path: AppIcons.heart,
//                         color: ColorManager.white,
//                       )
//                     )
//                         :  CustomSvgAssets(
//                       path: AppIcons.heart,
//                     )
//                 )
//               ],
//             ),
//             SizedBox(height: 3),
//             SizedBox(
//               height: 110,
//               width: 110,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(6),
//                 child: CachedNetworkImage(
//                   placeholder: (context, url) =>
//                       Center(child: const CircularProgressIndicator()),
//                   imageUrl: imageUrl,
//                 ),
//               ),
//             ),
//             SizedBox(height: 5),
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
//             Text(
//               price,
//               softWrap: true,
//               maxLines: 1,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: FontSize.s12,
//                 overflow: TextOverflow.clip,
//                 color: ColorManager.primary,
//               ),
//             ),
//             SizedBox(height: 4),
//             Expanded(
//               child: Text(
//                 price == oldPrice ? '': oldPrice,
//                 softWrap: true,
//                 maxLines: 1,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   decoration: TextDecoration.lineThrough,
//                   fontSize: FontSize.s11,
//                   overflow: TextOverflow.clip,
//                   color: ColorManager.secondaryTextColor,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
