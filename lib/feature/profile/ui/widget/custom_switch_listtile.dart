import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';

class CustomSwitchListTile extends StatefulWidget {
  CustomSwitchListTile({
    required this.title,
    required this.value,
    super.key,
  });

  late bool value;
  final String title;

  @override
  State<CustomSwitchListTile> createState() => _CustomSwitchListTileState();
}

class _CustomSwitchListTileState extends State<CustomSwitchListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          widget.value = !widget.value;
        });
      },
      title: Text(widget.title),
      trailing: CupertinoSwitch(
        activeColor: ColorManager.primary,
        trackColor: ColorManager.boardingBackGroundColor1,
        value: widget.value,
        onChanged: (val) {
          setState(() {
            widget.value = val;
          });
        },
      ),
    );
  }
}
