import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qa3a_owner/core/data/dummy/dummy_data.dart';
import 'package:qa3a_owner/features/onboarding/widget/buttons.dart';
import 'package:qa3a_owner/features/onboarding/widget/image_and_text.dart';
import 'package:qa3a_owner/features/onboarding/widget/indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /// pages
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final data = onboardingData[index];

                return ImageAndText(data: data);
              },
            ),
          ),

          /// indicator
          Indicator(controller: _controller),

          SizedBox(height: 20.h),

          /// buttons
          Buttons(currentIndex: currentIndex, controller: _controller),

          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
