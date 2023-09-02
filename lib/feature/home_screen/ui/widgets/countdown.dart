import 'package:flutter/material.dart';

const kblueColor = Color(0xFF00D9F6);
const kgreyColor = Color(0xFF6C7589);
const kbackgroundColor = Color(0xFF0E121E);

// final largeTextStyle = GoogleFonts.poppins(
//     color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold);
// final smallTextStyle =
//     GoogleFonts.poppins(color: kbackgroundColor, fontWeight: FontWeight.w600);

// class CountDownTimer extends StatefulWidget {
//   const CountDownTimer({Key? key}) : super(key: key);
//
//   @override
//   State<CountDownTimer> createState() => _CountDownTimerState();
// }
//
// final _countDownController = CountDownController();
//
// class _CountDownTimerState extends State<CountDownTimer> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//
//           ],
//         )
//       ],
//     );
//   }
// }

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const Button({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(),
    );
  }
}
