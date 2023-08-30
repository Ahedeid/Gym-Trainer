import 'package:flutter/material.dart';
import 'package:gym_app/utils/resources/style_manger.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.iconAction,
    this.onTap,
    this.visible = false,
  });

  final String title;
  final String? iconAction;
  final void Function()? onTap;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: color,
      elevation: 0,
      centerTitle: true,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 10.addVerticalSpace,
          Text(
            title.toUpperCase(),
            style: StyleManger.headLineBar(),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   CustomAppBar({
//     super.key,
//     required this.title,
//     this.iconAction,
//     this.onTap,
//     this.visible = false,
//   });
//
//   final String title;
//   final String? iconAction;
//   final void Function()? onTap;
//   final bool visible;
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       // bottom: TabBar(
//       //   isScrollable: true,
//       //   dividerColor: Colors.transparent,
//       //   indicatorColor: Colors.transparent,
//       //   labelColor: Colors.white,
//       //   unselectedLabelColor: Colors.black,
//       //   tabs: Level.values.map((level) {
//       //     return Tab(
//       //       child: Container(
//       //         decoration: BoxDecoration(
//       //           borderRadius: BorderRadius.circular(5),
//       //           color: ColorManager.greyButton,
//       //         ),
//       //         child: Padding(
//       //           padding: const EdgeInsets.all(8.0),
//       //           child: Text(
//       //             "${level.name}",
//       //           ),
//       //         ),
//       //       ),
//       //     );
//       //   }).toList(),
//       // ),
//       elevation: 0,
//       centerTitle: true,
//       title: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title.toUpperCase(), style: StyleManger.headLineBar()),
//         ],
//       ),
//       actions: [
//         GestureDetector(
//           onTap: onTap,
//           child: Container(
//             width: 42.w,
//             height: 42.h,
//             decoration: BoxDecoration(
//                 color: ColorManager.white,
//                 borderRadius: BorderRadius.circular(8)),
//             child: CustomSvgAssets(
//               path: AppIcons.filter,
//               color: Colors.black,
//             ),
//           ),
//         ),
//         10.addHorizontalSpace
//       ],
//     );
//   }
//
//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => const Size.fromHeight(60);
// }
