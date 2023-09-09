import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/feature/profile/provider/profile_provider.dart';
import 'package:gym_app/feature/registrations/model/user_model.dart';
import 'package:gym_app/logic/localData/shared_pref.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/sheared/widget/custom_appBar-secondary.dart';
import 'package:gym_app/sheared/widget/custom_button.dart';
import 'package:gym_app/sheared/widget/main_container.dart';
import 'package:gym_app/sheared/widget/textField_and_above_text.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
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
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProfileProvider>().imageURL =
        sl<SharedPrefController>().getUserData().image;
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        var name = widget.userData?.name ?? '';
        var email = widget.userData?.email ?? '';
        var phone = widget.userData?.phone ?? '';
        nameController.text = name;
        emailController.text = email;
        phoneController.text = phone;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarSecondary(
        title: updateYourInfo.tr(),
        subTitle: updateYourBasic.tr(),
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
            Consumer<ProfileProvider>(
              builder: (context, value, child) => GestureDetector(
                onTap: () {
                  _showPicker(
                    context: context,
                    onTapGallery: () {
                      value.imgFromGallery();
                    },
                    onTapCamera: () {
                      value.imgFromCamera();
                    },
                  );
                },
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
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                          height: 59,
                          width: 59,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: value.imageURL != null
                                  ? CachedNetworkImage(
                                      width: 59,
                                      height: 59,
                                      fit: BoxFit.cover,
                                      imageUrl: value.imageURL!,
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              Center(
                                        child: CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    )
                                  : Placeholder())),
                      const SizedBox(height: 8),
                      Text(
                        uploadNewPicture.tr(),
                        style: StyleManger.headline4(
                          color: ColorManager.primary,
                        ),
                      )
                    ],
                  ),
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
                    text: displayName.tr(),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 10),
                  TextFieldAndAboveText(
                    // backGroundColor: ColorManager.backGroundField,
                    controller: emailController,
                    validator: (val) => val!.validateEmail(),
                    text: email.tr(),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 10),
                  TextFieldAndAboveText(
                    // backGroundColor: ColorManager.backGroundField,
                    controller: phoneController,
                    validator: (val) => val!.validatePhoneNumber(),
                    text: phone.tr(),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
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
            isLoading: value.isLoadingEdit || value.isLoadingImage,
            onPressed: () {
              value.EditUserProfile(
                name: nameController.text,
                email: emailController.text,
                phone: phoneController.text,
              );
            },
            title: saveChanges,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  void _showPicker({
    required BuildContext context,
    required void Function() onTapGallery,
    required void Function() onTapCamera,
  }) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: MainContainer(
              color: ColorManager.scaffoldColor,
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text("gallery".tr()),
                      onTap: onTapGallery),
                  new ListTile(
                      leading: new Icon(Icons.photo_camera),
                      title: new Text("camera".tr()),
                      onTap: onTapCamera),
                ],
              ),
            ),
          );
        });
  }
}
