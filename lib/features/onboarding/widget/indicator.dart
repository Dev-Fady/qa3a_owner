
import 'package:flutter/material.dart';
import 'package:qa3a_owner/core/data/dummy/dummy_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required PageController controller,
  }) : _controller = controller;

  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: _controller,
      count: onboardingData.length,
      effect: const ExpandingDotsEffect(
        activeDotColor: Colors.blue,
        dotHeight: 8,
        dotWidth: 8,
      ),
    );
  }
}
