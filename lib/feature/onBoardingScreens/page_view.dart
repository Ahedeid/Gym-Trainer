import 'package:flutter/material.dart';
import 'package:gym_app/feature/onBoardingScreens/model/pageViewModel.dart';
import 'package:gym_app/feature/onBoardingScreens/widget/bodyTextOnBoarding.dart';
import 'package:gym_app/feature/onBoardingScreens/widget/cust_button_onBording.dart';
import 'package:gym_app/feature/onBoardingScreens/widget/headerTextOnBording.dart';
import 'package:gym_app/feature/onBoardingScreens/widget/on_boarding_indicatort.dart';
import 'package:gym_app/logic/localData/shared_pref.dart';
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
    SharedPrefController().setShowOnce(true);
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
    const Color(0xFFEFE8F9),
    const Color(0xFFFCF4EA),
    const Color(0xFFDEEBEB),
  ];

  List<Color> listOfColor = [
    ColorManager.primary,
    const Color(0xFFE29835),
    ColorManager.secondary
  ];

  List<Color> listOfSColor = [
    ColorManager.secondPrimary,
    const Color(0xFFF6E0C2),
    const Color(0xFFBED9D7),
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  HeaderTxtOnBoarding(data: _data, index: _index),
                  const SizedBox(height: 30),
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
        ],
      ),
    );
  }
}
