import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';

class HeaderSectionWidget extends StatelessWidget {
  final String? title;
  final String? trailing;
  final void Function()? onTap;
  const HeaderSectionWidget({Key? key, this.title, this.trailing, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!.tr(),
          style: TextStyle(
              color: ColorManager.black,
              fontSize: 18,
              fontWeight: FontWeight.w400),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            trailing!.tr(),
            style: TextStyle(
                color: ColorManager.black,
                fontSize: FontSize.s12.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
