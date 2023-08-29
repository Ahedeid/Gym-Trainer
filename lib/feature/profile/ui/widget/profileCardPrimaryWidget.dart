import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/feature/profile/provider/profile_provider.dart';
import 'package:gym_app/logic/localData/shared_pref.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/sheared/widget/CustomeSvg.dart';
import 'package:gym_app/sheared/widget/main_container.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/icons_constant.dart';
import 'package:gym_app/utils/resources/style_manger.dart';
import 'package:provider/provider.dart';

class ProfileCardPrimaryWidget extends StatefulWidget {
  const ProfileCardPrimaryWidget({
    super.key,
  });

  @override
  State<ProfileCardPrimaryWidget> createState() =>
      _ProfileCardPrimaryWidgetState();
}

class _ProfileCardPrimaryWidgetState extends State<ProfileCardPrimaryWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, value, child) => Container(
        decoration: BoxDecoration(
            color: Colors.white, // Your desired background color
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 4,
                  offset: Offset(0, 1)),
            ]),
        child: value.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListTile(
                onTap: () {
                  sl<AppRouter>().goTo(
                      screenName: ScreenName.updateProfileScreen,
                      object: sl<SharedPrefController>().getUserData());
                },
                tileColor: ColorManager.white,
                contentPadding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                leading: SizedBox(
                    height: 59,
                    width: 59,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        width: 59,
                        height: 59,
                        fit: BoxFit.cover,
                        imageUrl:
                            sl<SharedPrefController>().getUserData().image,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    )),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${sl<SharedPrefController>().getUserData().name}",
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                      style: StyleManger.headline3(),
                    ),
                    Text(
                      '@${sl<SharedPrefController>().getUserData().email.toLowerCase()}',
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                      style: StyleManger.headline4(
                          color: ColorManager.secondaryTextColor),
                    ),
                  ],
                ),
                trailing: MainContainer(
                    height: 40,
                    width: 40,
                    color: ColorManager.backGroundSecondary,
                    child: CustomSvgAssets(
                      path: AppIcons.edit,
                      color: ColorManager.secondary,
                    )),
              ),
      ),
    );
  }
}
