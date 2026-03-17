import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qa3a_owner/features/add_hall/presentation/screen/widget/hall_type.dart';

class BasicInfoStep extends StatelessWidget {
  const BasicInfoStep({
    super.key,
    required this.selectedType,
    required this.onTypeSelected,
  });

  final String? selectedType;
  final Function(String) onTypeSelected;

  @override
  Widget build(BuildContext context) {
    final List<String> hallTypes = ["زفاف", "مؤتمرات", "أعياد ميلاد", "عزاء", "أخرى"];

    return Column(
      key: const ValueKey(0),
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // اسم القاعة
        _buildTitle("اسم القاعة"),
        SizedBox(height: 8.h),
        _buildTextField(hintText: "ادخل اسم القاعة"),

        SizedBox(height: 20.h),

        // نوع القاعة
        _buildTitle("نوع القاعة"),
        SizedBox(height: 10.h),
        Container(
          padding: EdgeInsets.all(10.w),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Wrap(
            spacing: 10.w,
            runSpacing: 10.h,
            children: hallTypes
                .map((type) => HallType(
                      title: type,
                      isSelected: selectedType == type,
                      onTap: () => onTypeSelected(type),
                    ))
                .toList(),
          ),
        ),

        SizedBox(height: 20.h),

        // وصف القاعة
        _buildTitle("وصف القاعة"),
        SizedBox(height: 8.h),
        _buildTextField(hintText: "اكتب وصفًا تفصيليًا عن القاعة ....", maxLines: 5),
      ],
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
    );
  }

  Widget _buildTextField({required String hintText, int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: hintText,
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
