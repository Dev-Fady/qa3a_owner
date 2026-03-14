
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final bool isPrimary;
  final VoidCallback? onPressed;

  const ActionButton({
    super.key,
    required this.text,
    this.isPrimary = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 38.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: isPrimary ? const Color(0xff2F80ED) : Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: const Color(0xff2F80ED)),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isPrimary ? Colors.white : const Color(0xff2F80ED),
              fontSize: 10.sp,
            ),
          ),
        ),
      ),
    );
  }
}
