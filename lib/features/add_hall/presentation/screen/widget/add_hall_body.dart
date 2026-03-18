

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qa3a_owner/config/routes/router_name.dart';
import 'package:qa3a_owner/features/add_hall/presentation/manager/add_hall_cubit.dart';

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
  void nextStep(AddHallCubit cubit) {
    if (cubit.currentStep < 3) {
      cubit.updateStep(cubit.currentStep + 1);
    } else {
      cubit.saveHall();
    }
  }

  void previousStep(AddHallCubit cubit) {
    if (cubit.currentStep > 0) {
      cubit.updateStep(cubit.currentStep - 1);
    }
  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AddHallCubit, AddHallState>(
      listener: (context, state) {
        if (state is AddHallSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("تم حفظ القاعة بنجاح")),
          );
          // Using goNamed instead of pop because AddHallScreen is a ShellRoute sibling
          // and might have been reached via .go() which doesn't push to stack.
          context.goNamed(RouterName.homeScreen);
        } else if (state is AddHallFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("فشل الحفظ: ${state.message}")),
          );
        }
      },

      builder: (context, state) {
        final cubit = context.read<AddHallCubit>();
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
                AddHallStepper(currentStep: cubit.currentStep),

                SizedBox(height: 24.h),

                // Step Content
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: state is AddHallLoading 
                    ? const Center(child: CircularProgressIndicator())
                    : _buildCurrentStep(cubit),
                ),

                SizedBox(height: 30.h),

                // Navigation Buttons
                StepNavigationButtons(
                  currentStep: cubit.currentStep,
                  onNext: () => nextStep(cubit),
                  onPrevious: () => previousStep(cubit),
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCurrentStep(AddHallCubit cubit) {
    switch (cubit.currentStep) {
      case 0:
        return BasicInfoStep(
          nameController: cubit.nameController,
          descriptionController: cubit.descriptionController,
          selectedType: cubit.selectedType,
          onTypeSelected: cubit.updateType,
        );
      case 1:
        return LocationCapacityStep(
          addressController: cubit.addressController,
          capacityController: cubit.capacityController,
          pricePerHourController: cubit.pricePerHourController,
          pricePerDayController: cubit.pricePerDayController,
          selectedCity: cubit.selectedCity,
          onCityChanged: cubit.updateCity,
        );
      case 2:
        return PhotoStep(
          selectedImages: cubit.selectedImages,
          onAddImage: cubit.addImage,
          onRemoveImage: cubit.removeImage,
        );

      case 3:
        return ServicesOffers(
          services: cubit.services,
          packages: cubit.packages,
          onServicesUpdated: cubit.updateServices,
          onPackagesUpdated: cubit.updatePackages,
        );

      default:
        return PlaceHolder();
    }
  }
}


