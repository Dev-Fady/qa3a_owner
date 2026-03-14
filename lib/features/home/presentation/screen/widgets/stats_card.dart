import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatsCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String value;
  final String subTitle;

  const StatsCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.value,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(.15),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(icon, color: iconColor, size: 22.sp),
          ),

          SizedBox(height: 10.h),

          Text(
            title,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey[700]),
          ),

          SizedBox(height: 6.h),

          Text(
            value,
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xff0A2A5E),
            ),
          ),

          SizedBox(height: 6.h),

          Text(
            subTitle,
            style: TextStyle(fontSize: 11.sp, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
