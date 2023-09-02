import 'package:flutter/material.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/sheared/widget/main_container.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/images_constant.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            ImageApp.soon,
            fit: BoxFit.fill,
            height: double.infinity,
          ),
          Positioned(
              top: 90,
              left: 20,
              child: MainContainer(
                height: 39,
                width: 38,
                color: ColorManager.white,
                child: IconButton(
                    onPressed: () => sl<AppRouter>().back(),
                    icon: Icon(
                      Icons.arrow_back_ios,
                    )),
              ))
        ],
      ),
    );
  }
}
