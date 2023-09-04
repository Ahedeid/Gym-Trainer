import 'package:flutter/material.dart';
import 'package:gym_app/sheared/widget/customAppBar.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';

class OurShopScreen extends StatelessWidget {
  const OurShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.mealsPlan,
        onTap: () {},
      ),
      body: const Center(
        child: Text(
          'OurShop Screen',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
