import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qa3a_owner/core/theme/app_theme.dart';
import 'package:qa3a_owner/features/settings/presentation/screen/widget/logout.dart';
import 'package:qa3a_owner/features/settings/presentation/screen/widget/profile_section.dart';
import 'package:qa3a_owner/features/settings/presentation/screen/widget/settings_item.dart';
import 'package:qa3a_owner/features/settings/presentation/screen/widget/settings_section.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('الإعدادات', style: AppTextStyles.heading2),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            ProfileSection(),
            SizedBox(height: 24.h),
            SettingsSection(
              title: 'الإعدادات العامة',
              children: [
                SettingsItem(
                  icon: Icons.language_outlined,
                  title: 'اللغة',
                  subtitle: 'العربية',
                  onTap: () {},
                ),
                SettingsItem(
                  icon: Icons.notifications_none_outlined,
                  title: 'الإشعارات',
                  onTap: () {},
                ),
                SettingsItem(
                  icon: Icons.dark_mode_outlined,
                  title: 'الوضع الليلي',
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {},
                    activeColor: AppColors.primary,
                  ),
                  onTap: () {},
                ),
              ],
            ),

            // Account Section
            SettingsSection(
              title: 'الحساب',
              children: [
                SettingsItem(
                  icon: Icons.lock_outline_rounded,
                  title: 'تغيير كلمة المرور',
                  onTap: () {},
                ),
                SettingsItem(
                  icon: Icons.privacy_tip_outlined,
                  title: 'الخصوصية',
                  onTap: () {},
                ),
              ],
            ),

            // Support Section
            SettingsSection(
              title: 'الدعم والمعلومات',
              children: [
                SettingsItem(
                  icon: Icons.info_outline,
                  title: 'عن التطبيق',
                  onTap: () {},
                ),
                SettingsItem(
                  icon: Icons.star_border_rounded,
                  title: 'تقييم التطبيق',
                  onTap: () {},
                ),
                SettingsItem(
                  icon: Icons.help_outline_rounded,
                  title: 'المساعدة والدعم',
                  onTap: () {},
                ),
              ],
            ),

            // Logout Button
            Logout(),
            SizedBox(height: 80.h), // Bottom nav bar space
          ],
        ),
      ),
    );
  }
}
