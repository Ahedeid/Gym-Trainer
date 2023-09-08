import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/sheared/widget/customAppBar.dart';

class GymFamilyScreen extends StatefulWidget {
  const GymFamilyScreen({super.key});

  @override
  State<GymFamilyScreen> createState() => _GymFamilyScreenState();
}

class _GymFamilyScreenState extends State<GymFamilyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Gym Family! 🏋🏻‍♀️'.tr(),
        onTap: () {},
      ),
      body: Center(
        child: Text(
          'GymFamily Screen'.tr(),
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
