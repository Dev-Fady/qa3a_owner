import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qa3a_owner/core/constant/image_name.dart';
import 'package:qa3a_owner/core/theme/app_theme.dart';
import 'package:qa3a_owner/features/auth/sign_on/presentation/screen/sign_on_screen.dart';
import 'package:qa3a_owner/features/auth/sign_up/presentation/screen/sign_up_screen.dart';
import 'package:qa3a_owner/features/auth/widgets/auth_tab_bar.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int _selectedTab = 0; // 0 = Sign In, 1 = Sign Up

  void _switchTab(int index) {
    setState(() => _selectedTab = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 32.h),

                // ── Logo ──────────────────────────────────
                Image.asset(ImageName.logo, height: 56.h, width: 56.w),

                SizedBox(height: 16.h),

                // ── Subtitle ──────────────────────────────
                Text(
                  'منصة إدارة القاعات الاحترافية',
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body1.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 14.sp,
                  ),
                ),

                SizedBox(height: 32.h),

                // ── Card ──────────────────────────────────
                _buildCard(),

                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A73E8).withValues(alpha: 0.08),
            blurRadius: 30,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ── Welcome text ──────────────────────────
          Text(
            'مرحباً بك',
            textDirection: TextDirection.rtl,
            style: AppTextStyles.heading2.copyWith(fontSize: 24.sp),
          ),
          SizedBox(height: 6.h),
          Text(
            'ابدأ بإدارة قاعاتك بكل الاحترافية',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: AppTextStyles.body1.copyWith(fontSize: 13.sp),
          ),

          SizedBox(height: 24.h),

          // ── Tab bar ───────────────────────────────
          AuthTabBar(
            selectedIndex: _selectedTab,
            onSignInTap: () => _switchTab(0),
            onSignUpTap: () => _switchTab(1),
          ),

          SizedBox(height: 24.h),

          // ── Animated form switcher ────────────────
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              final offset = _selectedTab == 0
                  ? const Offset(-0.15, 0)
                  : const Offset(0.15, 0);
              return SlideTransition(
                position: Tween<Offset>(
                  begin: offset,
                  end: Offset.zero,
                ).animate(animation),
                child: FadeTransition(opacity: animation, child: child),
              );
            },
            child: _selectedTab == 0
                ? const SignOnScreen()   // ← Sign In form
                : const SignUpScreen(),  // ← Sign Up form
          ),
        ],
      ),
    );
  }
}
