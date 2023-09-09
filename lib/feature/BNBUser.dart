import 'package:flutter/material.dart';
import 'package:gym_app/feature/articles/ui/articles_screen.dart';
import 'package:gym_app/feature/home_screen/ui/home_screen.dart';
import 'package:gym_app/feature/meals_plan/ui/meals_plan_screen.dart';
import 'package:gym_app/feature/profile/ui/profile_screen.dart';
import 'package:gym_app/feature/Training/ui/training_screen.dart';
import 'package:gym_app/sheared/widget/CustomSvg.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/icons_constant.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BNBUser extends StatelessWidget {
  const BNBUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;
    controller = PersistentTabController(initialIndex: 0);

    List<Widget> _buildScreens() {
      return [
        const HomeScreen(),
        const TrainingScreen(),
        const ArticlesScreen(),
        const MealsPlan(),
        const ProfileScreen(),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        buildPersistentBottomNavBarItem(
          iconActive: AppIcons.homeSelected,
          iconNonActive: AppIcons.homeUnSelected,
        ),
        buildPersistentBottomNavBarItem(
          iconActive: AppIcons.workOutSelected,
          iconNonActive: AppIcons.workOutUnSelected,
        ),
        buildPersistentBottomNavBarItem(
          iconActive: AppIcons.articles,
          iconNonActive: AppIcons.articles,
        ),
        buildPersistentBottomNavBarItem(
          iconActive: AppIcons.meals,
          iconNonActive: AppIcons.meals,
        ),
        buildPersistentBottomNavBarItem(
          iconActive: AppIcons.profileSelected,
          iconNonActive: AppIcons.profileUnSelected,
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(8), topLeft: Radius.circular(8)),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style3,
    );
  }

  PersistentBottomNavBarItem buildPersistentBottomNavBarItem({
    required String iconActive,
    required String iconNonActive,
  }) {
    return PersistentBottomNavBarItem(
      icon: CustomSvgAssets(
        path: iconActive,
        color: ColorManager.primary,
      ),
      inactiveIcon: CustomSvgAssets(
        color: Colors.grey,
        path: iconNonActive,
      ),
      activeColorPrimary: ColorManager.primary,
      inactiveColorPrimary: ColorManager.secondary,
    );
  }
}
