// import 'package:flutter/material.dart';
//
//
// class CustomAppBarHome extends StatelessWidget implements PreferredSizeWidget {
//   const CustomAppBarHome({
//     super.key,
//     required this.titleAppBar,
//     required this.Index,
//   });
//
//   final List<String> titleAppBar;
//   final int Index;
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Colors.transparent,
//       centerTitle: true,
//       elevation: 0,
//       leading: GestureDetector(
//         onTap: () {
//           AppRouter.goTo(screenName: ScreenName.categoryScreen);
//         },
//         child: CustomSvgAssets(
//           path: AppIcons.category,
//           color: Colors.black,
//         ),
//       ),
//       title: Text(
//         titleAppBar[Index],
//         style: TextStyle(
//             fontSize: FontSize.s18,
//             fontWeight: FontWeight.w600,
//             color: ColorManager.primaryTextColor),
//       ),
//       actions: [
//         Padding(
//           padding: const EdgeInsets.only(right: 20, top: 13),
//           child: GestureDetector(
//             onTap: () {
//               AppRouter.goTo(screenName: ScreenName.notificationScreen);
//             },
//             child: Stack(
//               alignment: Alignment.topRight,
//               children: [
//                 CustomSvgAssets(
//                   path: AppIcons.notification,
//                 ),
//                 Container(
//                   width: 10,
//                   height: 10,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: ColorManager.notificationIndicatorColor,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
//
//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => const Size.fromHeight(60);
// }
