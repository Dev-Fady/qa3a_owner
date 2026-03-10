import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qa3a_owner/core/theme/app_theme.dart';

class AuthTabBar extends StatelessWidget {
  final int selectedIndex;
  final VoidCallback onSignInTap;
  final VoidCallback onSignUpTap;

  const AuthTabBar({
    super.key,
    required this.selectedIndex,
    required this.onSignInTap,
    required this.onSignUpTap,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.tabInactive,
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.all(4.r),
        child: Row(
          children: [
            // Sign In tab (تسجيل الدخول)
            Expanded(
              child: GestureDetector(
                onTap: onSignInTap,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  decoration: BoxDecoration(
                    color: selectedIndex == 0
                        ? AppColors.tabActive
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(9.r),
                    boxShadow: selectedIndex == 0
                        ? [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.25),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            )
                          ]
                        : [],
                  ),
                  child: Text(
                    'تسجيل الدخول',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.tab.copyWith(
                      color: selectedIndex == 0
                          ? AppColors.tabTextActive
                          : AppColors.tabTextInactive,
                    ),
                  ),
                ),
              ),
            ),
            // Sign Up tab (حساب جديد)
            Expanded(
              child: GestureDetector(
                onTap: onSignUpTap,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  decoration: BoxDecoration(
                    color: selectedIndex == 1
                        ? AppColors.tabActive
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(9.r),
                    boxShadow: selectedIndex == 1
                        ? [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.25),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            )
                          ]
                        : [],
                  ),
                  child: Text(
                    'حساب جديد',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.tab.copyWith(
                      color: selectedIndex == 1
                          ? AppColors.tabTextActive
                          : AppColors.tabTextInactive,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
