import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  String getGreeting() {
    final hour = this.hour;

    if (hour >= 5 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }
}
