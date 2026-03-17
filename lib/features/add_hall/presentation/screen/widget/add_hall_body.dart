import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qa3a_owner/features/add_hall/presentation/screen/widget/add_hall_stepper.dart';
import 'package:qa3a_owner/features/add_hall/presentation/screen/widget/basic_info_step.dart';
import 'package:qa3a_owner/features/add_hall/presentation/screen/widget/location_capacity_step.dart';
import 'package:qa3a_owner/features/add_hall/presentation/screen/widget/photo_step.dart';
import 'package:qa3a_owner/features/add_hall/presentation/screen/widget/place_holder.dart';
import 'package:qa3a_owner/features/add_hall/presentation/screen/widget/services_offers.dart';
import 'package:qa3a_owner/features/add_hall/presentation/screen/widget/step_navigation_buttons.dart';

class AddHallBody extends StatefulWidget {
  const AddHallBody({super.key});

  @override
  State<AddHallBody> createState() => _AddHallBodyState();
}

class _AddHallBodyState extends State<AddHallBody> {
  int currentStep = 0;
  String? selectedType;

  void nextStep() {
    if (currentStep < 3) {
      setState(() {
        currentStep++;
      });
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Text(
              "املأ البيانات التالية لإضافة قاعتك",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.blue.shade900,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.h),

            // Stepper
            AddHallStepper(currentStep: currentStep),
            
            SizedBox(height: 24.h),

            // Step Content
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _buildCurrentStep(),
            ),

            SizedBox(height: 30.h),

            // Navigation Buttons
            StepNavigationButtons(
              currentStep: currentStep,
              onNext: nextStep,
              onPrevious: previousStep,
            ),
            
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentStep() {
    switch (currentStep) {
      case 0:
        return BasicInfoStep(
          selectedType: selectedType,
          onTypeSelected: (type) {
            setState(() {
              selectedType = type;
            });
          },
        );
      case 1:
        return const LocationCapacityStep();
      case 2:
        return const PhotoStep();
      case 3:
        return const ServicesOffers();
      default:
        return  PlaceHolder();
    }
  }
}

