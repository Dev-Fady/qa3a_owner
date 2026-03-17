import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationCapacityStep extends StatelessWidget {
  const LocationCapacityStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // العنوان
        _buildTitle("العنوان"),
        SizedBox(height: 8.h),
        _buildTextField(hintText: "شارع _ حى _ مدينة"),

        SizedBox(height: 20.h),

        // المدينة
        _buildTitle("المدينة"),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: "القاهرة",
              items: ["القاهرة", "الجيزة", "الإسكندرية"]
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e, textAlign: TextAlign.right),
                      ))
                  .toList(),
              onChanged: (val) {},
              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.blue),
            ),
          ),
        ),

        SizedBox(height: 20.h),

        // إضافة الموقع
        _buildTitle("إضافة الموقع"),
        SizedBox(height: 8.h),
        Container(
          height: 150.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            image: const DecorationImage(
              image: NetworkImage("https://media.wired.com/photos/59269770af95806129f50b5e/master/pass/GoogleMap-660x440.jpg"), // Placeholder map
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Icon(Icons.location_on, color: Colors.red, size: 40.sp),
          ),
        ),

        SizedBox(height: 20.h),

        // السعة
        _buildTitle("السعة"),
        SizedBox(height: 8.h),
        _buildTextField(hintText: "500"),

        SizedBox(height: 20.h),

        // السعر / ساعة
        _buildTitle("السعر / ساعة"),
        SizedBox(height: 8.h),
        _buildTextField(hintText: "1000"),

        SizedBox(height: 20.h),

        // السعر / يوم
        _buildTitle("السعر / يوم"),
        SizedBox(height: 8.h),
        _buildTextField(hintText: "15000"),
      ],
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
    );
  }

  Widget _buildTextField({required String hintText}) {
    return TextField(
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.blue.withOpacity(0.4)),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
