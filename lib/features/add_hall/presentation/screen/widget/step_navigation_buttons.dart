import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qa3a_owner/features/add_hall/presentation/screen/widget/button_next.dart';

class StepNavigationButtons extends StatelessWidget {
  const StepNavigationButtons({
    super.key,
    required this.currentStep,
    required this.onNext,
    required this.onPrevious,
  });

  final int currentStep;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (currentStep > 0)
          Expanded(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                side: const BorderSide(color: Colors.blue),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              onPressed: onPrevious,
              child: Text("السابق",
                  style: TextStyle(fontSize: 16.sp, color: Colors.blue)),
            ),
          ),
        if (currentStep > 0) SizedBox(width: 16.w),

        Expanded(
          child: ButtonNext(
            onPressed: onNext,
            title: currentStep == 3 ? "حفظ" : "التالي",
          ),
        ),

      ],
    );
  }
}
