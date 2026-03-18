import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qa3a_owner/features/add_hall/presentation/screen/widget/build_item.dart';

class AddHallStepper extends StatelessWidget {
  const AddHallStepper({super.key, required this.currentStep});

  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10.r,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: BuildItem(
              icon: Icons.card_giftcard,
              title: "الخدمات والعروض",
              isActive: currentStep == 3,
              isCompleted: currentStep > 3,
            ),
          ),
          Flexible(
            child: BuildItem(
              icon: Icons.camera_alt_outlined,
              title: "الصور",
              isActive: currentStep == 2,
              isCompleted: currentStep > 2,
            ),
          ),
          Flexible(
            child: BuildItem(
              icon: Icons.location_on_outlined,
              title: "الموقع والسعة",
              isActive: currentStep == 1,
              isCompleted: currentStep > 1,
            ),
          ),
          Flexible(
            child: BuildItem(
              icon: Icons.description_outlined,
              title: "معلومات أساسية",
              isActive: currentStep == 0,
              isCompleted: currentStep > 0,
            ),
          ),
        ],
      ),

    );
  }
}
