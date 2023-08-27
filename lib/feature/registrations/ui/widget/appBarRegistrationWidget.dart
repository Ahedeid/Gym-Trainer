import 'package:flutter/material.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/sheared/widget/CustomeSvg.dart';

class AppBarRegistrationWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarRegistrationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          sl<AppRouter>().back();
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: InkWell(
            onTap: () {},
            child: const CustomSvgAssets(
              // path: AppIcons.dangerCircle,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
