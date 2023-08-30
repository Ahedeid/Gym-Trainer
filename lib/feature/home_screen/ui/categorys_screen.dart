import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/feature/home_screen/models/categorie_model.dart';
import 'package:gym_app/sheared/widget/customAppBar.dart';
import 'package:gym_app/utils/resources/sizes_in_app.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.categoryList});

  final List<CategoryModel> categoryList;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.category,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingHorizontal,
          vertical: AppSizes.paddingVertical,
        ),
        child: Wrap(
          children: [
            for (var list in widget.categoryList)
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 16),
                child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: list.image,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          list.name,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
