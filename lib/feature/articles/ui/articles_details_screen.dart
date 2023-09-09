import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/feature/articles/models/articles_model.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/sheared/widget/CustomSvg.dart';
import 'package:gym_app/sheared/widget/main_container.dart';
import 'package:gym_app/utils/extensions/sized_box.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/icons_constant.dart';
import 'package:gym_app/utils/resources/sizes_in_app.dart';
import 'package:gym_app/utils/resources/style_manger.dart';

class ArticlesDetailsScreen extends StatelessWidget {
  const ArticlesDetailsScreen({required this.articles, super.key});

  final ArticlesModel articles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            sl<AppRouter>().back(true);
          },
          child: MainContainer(
            left: 6,
            right: 6,
            top: 13,
            bottom: 13,
            color: Colors.grey.shade300,
            alignment: Alignment.center,
            child: CustomSvgAssets(
              path: AppIcons.back,
            ),
          ),
        ),
        title: Text(
          articles.title,
          maxLines: 3,
          style: StyleManger.headLineBar(),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingHorizontal,
          vertical: AppSizes.paddingVertical,
        ),
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Hero(
                tag: articles,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  height: 155.h,
                  width: double.infinity,
                  imageUrl: articles.image,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          ),
          16.addVerticalSpace,
          Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  width: 3,
                  color: ColorManager.secondary,
                )
              )
            ),
            padding: EdgeInsets.only(left: 10),
            child: Text(
              articles.subTitle,
              style: StyleManger.bodyText2(color: ColorManager.primaryTextColor),
            ),
          ),
          16.addVerticalSpace,
          Text(
            articles.body,
            style: StyleManger.bodyText2(color: ColorManager.secondaryTextColor),
          ),
          24.addVerticalSpace,
        ],
      ),
    );
  }
}
