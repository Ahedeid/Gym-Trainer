import 'package:flutter/material.dart';
import 'package:gym_app/feature/profile/provider/profile_provider.dart';
import 'package:gym_app/feature/profile/ui/widget/cardInProfileWidget.dart';
import 'package:gym_app/feature/profile/ui/widget/profileCardPrimaryWidget.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/sheared/widget/customAppBar.dart';
import 'package:gym_app/utils/resources/sizes_in_app.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Your Profile! 🙅🏻‍♂️',
          onTap: () {},
        ),
        body: Consumer<ProfileProvider>(
          builder: (context, value, child) => RefreshIndicator(
            onRefresh: () async {
              // await value.getADataUser();
            },
            child: ListView(
              padding: const EdgeInsets.symmetric(
                vertical: AppSizes.paddingVertical,
                horizontal: AppSizes.paddingHorizontal,
              ),
              children: [
                const ProfileCardPrimaryWidget(
                    // icon: Icons.arrow_forward_ios,
                    ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.white, // Your desired background color
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 4,
                            offset: const Offset(0, 1)),
                      ]),
                  child: Column(
                    children: [
                      CardInProfileWidget(
                        title: AppStrings.memberShipPlan,
                        onTap: () {
                          // AppRouteouter.goTo(screenName: ScreenName.orderTrackingScreen);
                        },
                      ),
                      const Divider(
                        thickness: 1,
                        endIndent: 16,
                        indent: 16,
                        color: Color(0xFFEFF0F1),
                      ),
                      CardInProfileWidget(
                        title: AppStrings.unitsOfMeasure,
                        onTap: () {
                          // AppRouter.goTo(screenName: ScreenName.paymentScreen);
                        },
                      ),
                      const Divider(
                        thickness: 1,
                        endIndent: 16,
                        indent: 16,
                        color: Color(0xFFEFF0F1),
                      ),
                      CardInProfileWidget(
                        title: AppStrings.attendanceHistory,
                        onTap: () {
                          // AppRouter.goTo(screenName: ScreenName.myPurchessScreen);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.white, // Your desired background color
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 4,
                            offset: const Offset(0, 1)),
                      ]),
                  child: Column(
                    children: [
                      CardInProfileWidget(
                        title: AppStrings.myPaymentMethods,
                        onTap: () {
                          // AppRouteouter.goTo(screenName: ScreenName.orderTrackingScreen);
                        },
                      ),
                      const Divider(
                        thickness: 1,
                        endIndent: 16,
                        indent: 16,
                        color: Color(0xFFEFF0F1),
                      ),
                      CardInProfileWidget(
                        title: AppStrings.changeLanguage,
                        onTap: () {
                          // AppRouter.goTo(screenName: ScreenName.myPurchessScreen);
                        },
                      ),
                      const Divider(
                        thickness: 1,
                        endIndent: 16,
                        indent: 16,
                        color: Color(0xFFEFF0F1),
                      ),
                      CardInProfileWidget(
                        title: AppStrings.notificationsSettings,
                        onTap: () {
                          // AppRouter.goTo(screenName: ScreenName.myPurchessScreen);
                        },
                      ),
                      const Divider(
                        thickness: 1,
                        endIndent: 16,
                        indent: 16,
                        color: Color(0xFFEFF0F1),
                      ),
                      CardInProfileWidget(
                        title: AppStrings.termsConditions,
                        onTap: () {
                          // AppRouter.goTo(screenName: ScreenName.myPurchessScreen);
                        },
                      ),
                      const Divider(
                        thickness: 1,
                        endIndent: 16,
                        indent: 16,
                        color: Color(0xFFEFF0F1),
                      ),
                      CardInProfileWidget(
                        title: AppStrings.fAQsConditions,
                        onTap: () {
                          // AppRouter.goTo(screenName: ScreenName.myPurchessScreen);
                        },
                      ),
                      const Divider(
                        thickness: 1,
                        endIndent: 16,
                        indent: 16,
                        color: Color(0xFFEFF0F1),
                      ),
                      CardInProfileWidget(
                        title: AppStrings.logout,
                        onTap: () async {
                          await sl<ProfileProvider>().logout();
                          // AppRouter.goTo(screenName: ScreenName.myPurchessScreen);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
