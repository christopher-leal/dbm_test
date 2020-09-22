import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SpinnerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/spinner.json'),
    );
  }
}
