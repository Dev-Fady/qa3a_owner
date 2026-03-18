import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: 45.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Colors.blue.withAlpha(30)),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Color(0xFF1E6AD1)),
                SizedBox(width: 8.w),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'ابحث عن قاعة أو عميل...',
                      hintStyle: TextStyle(fontSize: 12),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          flex: 1,
          child: Container(
            height: 45.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              color: Colors.blue.withAlpha(40),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.keyboard_arrow_down, color: Color(0xFF1E6AD1)),
                Text(
                  'جميع الحجوزات',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: const Color(0xFF1E6AD1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}