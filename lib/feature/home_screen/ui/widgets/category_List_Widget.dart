import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/feature/home_screen/models/categorie_model.dart';

class CategoryListWidget extends StatelessWidget {
  final List<CategoryModel> categoryList;

  CategoryListWidget({required this.categoryList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        width: 13,
      ),
      itemCount: categoryList.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final categoryData = categoryList[index];
        return GestureDetector(
          onTap: () {},
          child: Column(
            children: [
              Container(
                width: 61,
                height: 61,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: categoryData.image,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  categoryData.name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
