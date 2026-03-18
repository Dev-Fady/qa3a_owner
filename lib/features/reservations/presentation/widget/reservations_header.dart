import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qa3a_owner/core/theme/app_theme.dart';

class ReservationsHeader extends StatelessWidget {
  const ReservationsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'إدارة الحجوزات',
          style: AppTextStyles.heading1.copyWith(
            color: const Color(0xFF0A2351),
            fontSize: 24.sp,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'إدارة و تتبع جميع حجوزات القاعات',
          style: AppTextStyles.body1.copyWith(
            color: const Color(0xFF1E6AD1),
          ),
        ),
      ],
    );
  }
}