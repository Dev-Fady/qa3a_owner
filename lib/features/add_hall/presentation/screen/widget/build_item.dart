import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildItem extends StatelessWidget {
  const BuildItem({
    super.key,
    required this.icon,
    required this.title,
    this.isActive = false,
    this.isCompleted = false,
  });
  final IconData icon;
  final String title;
  final bool isActive;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 48.h,
          width: 48.w,
          decoration: BoxDecoration(
            color: isCompleted
                ? Colors.blue
                : (isActive
                    ? Colors.blue.withOpacity(.1)
                    : Colors.transparent),
            borderRadius: BorderRadius.circular(12.r),
            border: isCompleted
                ? null
                : Border.all(
                    color: isActive ? Colors.blue : Colors.grey.shade300),
          ),
          child: Icon(
            isCompleted ? Icons.check_circle : icon,
            color: isCompleted ? Colors.white : (isActive ? Colors.blue : Colors.grey),
            size: 24.sp,
          ),
        ),
        SizedBox(height: 6.h),

        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 10.sp,
            color: isActive || isCompleted ? Colors.blue : Colors.grey,
            fontWeight: isActive || isCompleted ? FontWeight.bold : FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),

      ],
    );
  }
}