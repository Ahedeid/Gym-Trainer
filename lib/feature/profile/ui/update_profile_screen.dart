import 'package:flutter/material.dart';
import 'package:gym_app/feature/profile/provider/profile_provider.dart';
import 'package:gym_app/feature/registrations/model/user_model.dart';
import 'package:gym_app/sheared/widget/custom_appBar-secondary.dart';
import 'package:gym_app/sheared/widget/custom_button.dart';
import 'package:gym_app/sheared/widget/textField_and_above_text.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/images_constant.dart';
import 'package:gym_app/utils/resources/sizes_in_app.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';
import 'package:gym_app/utils/resources/style_manger.dart';
import 'package:gym_app/utils/validate_extension.dart';
import 'package:provider/provider.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({required this.userData, super.key});

  final UserModel? userData;

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var name = widget.userData?.name ?? '';
      var email = widget.userData?.email ?? '';
      nameController.text = name;
      emailController.text = email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarSecondary(
        title: AppStrings.updateYourInfo,
        subTitle: AppStrings.updateYourBasic,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild!.unfocus();
          }
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.paddingHorizontal,
            vertical: AppSizes.paddingVertical,
          ),
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white, // Your desired background color
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ]),
                child: Column(
                  children: [
                    SizedBox(
                      height: 59,
                      width: 59,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(ImageApp.ahed),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      AppStrings.uploadNewPicture,
                      style: StyleManger.headline4(
                        color: ColorManager.primary,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
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
                  TextFieldAndAboveText(
                    // backGroundColor: ColorManager.backGroundField,
                    controller: nameController,
                    validator: (val) => val!.validateUserName(),
                    text: AppStrings.displayName,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 10),
                  TextFieldAndAboveText(
                    // backGroundColor: ColorManager.backGroundField,
                    controller: emailController,
                    validator: (val) => val!.validateEmail(),
                    text: AppStrings.email,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingHorizontal,
          vertical: AppSizes.paddingVertical,
        ),
        child: Consumer<ProfileProvider>(
          builder: (context, value, child) => CustomButtonWidget(
            isLoading: value.isLoadingEdit,
            onPressed: () {
              value.EditNameProfile(
                  name: nameController.text, email: emailController.text);
            },
            title: AppStrings.saveChanges,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
