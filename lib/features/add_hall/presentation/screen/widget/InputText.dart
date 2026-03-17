import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputText extends StatelessWidget {
  const InputText({
    super.key,
    required this.label,
    this.hintText,
    required this.controller,
  });

  final String label;
  final String? hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return "هذا الحقل مطلوب";
          }
          return null;
        },
      ),
    );
  }
}
