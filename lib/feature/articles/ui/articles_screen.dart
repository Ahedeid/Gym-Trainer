import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/feature/articles/models/articles_model.dart';
import 'package:gym_app/logic/firebase_constant.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/sheared/widget/customAppBar.dart';
import 'package:gym_app/sheared/widget/main_container.dart';
import 'package:gym_app/utils/extensions/sized_box.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';
import 'package:gym_app/utils/resources/sizes_in_app.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';
import 'package:gym_app/utils/resources/style_manger.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.articles.tr(),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: sl<FirebaseFirestore>()
            .collection(FirebaseConstant.articles)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          var artList = snapshot.data!.docs;
          return ListView.builder(
              itemCount: artList.length,
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.paddingHorizontal,
                vertical: 8,
              ),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final data =
                    ArticlesModel.fromQueryDocumentSnapshot(artList[index]);
                return MainContainer(
                  bottom: 8,
                  color: ColorManager.white,
                  horizontal: 12,
                  child: GestureDetector(
                    onTap: () {
                      sl<AppRouter>().goTo(
                          screenName: ScreenName.articlesDetailsScreen,
                          object: data);
                    },
                    child: CustomShowArticles(data: data),
                  ),
                );
              });
        },
      ),
    );
  }
}

class CustomShowArticles extends StatelessWidget {
  const CustomShowArticles({
    super.key,
    required this.data,
  });

  final ArticlesModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        12.addVerticalSpace,
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              height: 155.h,
              width: double.infinity,
              imageUrl: data.image,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child:
                    CircularProgressIndicator(value: downloadProgress.progress),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
        16.addVerticalSpace,
        Text(
          data.title,
          style: StyleManger.headline3(
            fontSize: FontSize.s14,
          ),
        ),
        8.addVerticalSpace,
        Text(
          data.subTitle,
          style: StyleManger.bodyText(
            color: ColorManager.secondaryTextColor,
          ),
        ),
        12.addVerticalSpace,
      ],
    );
  }
}
