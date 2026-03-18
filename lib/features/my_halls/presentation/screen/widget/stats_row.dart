import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatsRow extends StatelessWidget {
  const StatsRow({super.key, required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StatCard("مرفوضة", "0", Colors.red, Colors.red.shade50),
        StatCard("قيد المراجعة", "0", Colors.orange, Colors.orange.shade50),
        StatCard(
          "موافق عليها",
          count.toString(),
          Colors.green,
          Colors.green.shade50,
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  const StatCard(this.title, this.count, this.color, this.bgColor, {super.key});
  final String title;
  final String count;
  final Color color;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(Icons.business, color: color, size: 20.sp),
          SizedBox(height: 4.h),
          Text(
            title,
            style: TextStyle(fontSize: 10.sp, color: Colors.grey),
          ),
          Text(
            count,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
