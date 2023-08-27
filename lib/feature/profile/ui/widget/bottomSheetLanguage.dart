import 'package:flutter/material.dart';
import 'package:gym_app/utils/resources/sizes_in_app.dart';

class BottomSheetLanguage extends StatefulWidget {
  const BottomSheetLanguage({Key? key}) : super(key: key);

  @override
  State<BottomSheetLanguage> createState() => _BottomSheetLanguageState();
}

enum lang { ar, en }

class _BottomSheetLanguageState extends State<BottomSheetLanguage> {
  lang? _lang = lang.en;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingHorizontal,
          vertical: AppSizes.paddingVertical),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile(
              title: const Text('English'),
              value: lang.en,
              groupValue: _lang,
              onChanged: (lang? val) {
                setState(() {
                  _lang = val;
                });
              }),
          RadioListTile(
              title: const Text('Arabic'),
              value: lang.ar,
              groupValue: _lang,
              onChanged: (lang? val) {
                setState(() {
                  _lang = val;
                });
              }),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
