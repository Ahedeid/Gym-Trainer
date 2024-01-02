import 'package:flutter/material.dart';
import 'package:gym_app/feature/on_boarding_screens/model/pageViewModel.dart';
import 'package:gym_app/feature/on_boarding_screens/widget/bodyTextOnBoarding.dart';
import 'package:gym_app/feature/on_boarding_screens/widget/cust_button_onBording.dart';
import 'package:gym_app/feature/on_boarding_screens/widget/headerTextOnBording.dart';
import 'package:gym_app/feature/on_boarding_screens/widget/on_boarding_indicatort.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/sizes_in_app.dart';

class PageViewScreens extends StatefulWidget {
  const PageViewScreens({Key? key}) : super(key: key);

  @override
  State<PageViewScreens> createState() => _PageViewScreensState();
}

class _PageViewScreensState extends State<PageViewScreens> {
  late PageController _controller;
  final List<PageViewModel> _data = PageViewModel.data;

  int _index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = PageController();
    _controller.addListener(() {
      setState(() {
        _index = _controller.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _controller = PageController();
    super.dispose();
  }

  List<Color> listOfBackGroundColor = [
    ColorManager.boardingBackGroundColor1,
    ColorManager.boardingBackGroundColor2,
    ColorManager.boardingBackGroundColor3,
  ];

  List<Color> listOfColor = [
    ColorManager.primary,
    ColorManager.buttonBoardingColor,
    ColorManager.secondary
  ];

  List<Color> listOfSColor = [
    ColorManager.secondaryIndecator1,
    ColorManager.secondaryIndecator2,
    ColorManager.secondPrimary,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: MediaQuery.sizeOf(context).height * 0.3,
            child: PageView.builder(
                controller: _controller,
                itemCount: _data.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    _data[index].imagePath!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                }),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.36,
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingHorizontal),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                color: listOfBackGroundColor[_index],
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    HeaderTxtOnBoarding(data: _data, index: _index),
                    const SizedBox(height: 24),
                    BodyTxtOnBoarding(data: _data, index: _index),
                    const SizedBox(height: 32),
                    CustomButtonOnBoarding(
                      index: _index,
                      controller: _controller,
                      color: listOfColor[_index],
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OnBoardingIndicator(
                          selected: _index == 0,
                          mainColor: listOfColor[0],
                          sColor: listOfSColor[_index],
                        ),
                        const SizedBox(width: 6),
                        OnBoardingIndicator(
                          selected: _index == 1,
                          mainColor: listOfColor[1],
                          sColor: listOfSColor[_index],
                        ),
                        const SizedBox(width: 6),
                        OnBoardingIndicator(
                          selected: _index == 2,
                          mainColor: listOfColor[2],
                          sColor: listOfSColor[_index],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
