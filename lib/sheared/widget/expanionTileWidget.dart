// import 'package:flutter/material.dart';
// import 'package:shop_app/utils/resources/colors_manger.dart';
// import 'package:shop_app/utils/resources/font_size.dart';
//
//
// class ExpanionTileWidget extends StatelessWidget {
//   const ExpanionTileWidget({
//     super.key,
//     required this.title,
//     this.text = '',
//     this.collapsedBackgroundColor = ColorManager.grayWhite,
//   });
//
//   final String title;
//   final String text;
//   final Color collapsedBackgroundColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return ExpansionTile(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(6),
//       ),
//       collapsedBackgroundColor: collapsedBackgroundColor,
//       title: Text(
//         title,
//         style: TextStyle(
//           fontSize: FontSize.s14,
//           color: Colors.black,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//       children: [
//         Text(
//           text,
//           style: TextStyle(
//             fontSize: FontSize.s14,
//             color: ColorManager.secondaryTextColor,
//           ),
//         )
//       ],
//     );
//   }
// }
