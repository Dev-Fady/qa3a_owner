import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qa3a_owner/core/constant/image_name.dart';

class BodySplashScreen extends StatelessWidget {
  const BodySplashScreen({
    super.key,
    required this.fadeAnimation,
    required this.scaleAnimation,
  });

  final Animation<double> fadeAnimation;
  final Animation<double> scaleAnimation;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: 50.h),
        FadeTransition(
          opacity: fadeAnimation,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: Center(child: Image.asset(ImageName.splash)),
          ),
        ),
        SizedBox(height: 50.h),
        Padding(
          padding: EdgeInsets.only(bottom: 40.h),
          child: Text(
            'نسعد بخدمتكم',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
