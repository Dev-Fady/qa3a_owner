import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReservationsStatCard extends StatelessWidget {
  const ReservationsStatCard({super.key, required this.title, required this.value, required this.color});
  final String title;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.blue.withAlpha(20)),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF0A2351).withAlpha(180),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}