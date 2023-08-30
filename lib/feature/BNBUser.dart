import 'package:flutter/material.dart';
import 'package:gym_app/feature/gym_family/ui/gym_family_screen.dart';
import 'package:gym_app/feature/home_screen/ui/home_screen.dart';
import 'package:gym_app/feature/our_shop/ui/our_shop_screen.dart';
import 'package:gym_app/feature/profile/ui/profile_screen.dart';
import 'package:gym_app/feature/workOut/ui/training_screen.dart';
import 'package:gym_app/sheared/widget/CustomeSvg.dart';
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
        const GymFamilyScreen(),
        const OurShopScreen(),
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
          iconActive: AppIcons.familySelected,
          iconNonActive: AppIcons.familyUnSelected,
        ),
        buildPersistentBottomNavBarItem(
          iconActive: AppIcons.shopSelected,
          iconNonActive: AppIcons.shopUnSelected,
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

  PersistentBottomNavBarItem buildPersistentBottomNavBarItem(
      {required String iconActive, required String iconNonActive}) {
    return PersistentBottomNavBarItem(
      icon: CustomSvgAssets(
        path: iconActive,
        color: ColorManager.primary,
      ),
      inactiveIcon: CustomSvgAssets(
        path: iconNonActive,
      ),
      activeColorPrimary: ColorManager.primary,
      inactiveColorPrimary: ColorManager.secondary,
    );
  }
}
