import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qa3a_owner/core/theme/app_theme.dart';

class AuthTextField extends StatefulWidget {
  final String label;
  final String hint;
  final bool isPassword;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;

  const AuthTextField({
    super.key,
    required this.label,
    required this.hint,
    this.isPassword = false,
    this.keyboardType,
    this.controller,
    this.validator,
    this.prefixIcon,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool _obscureText = true;
  bool _isFocused = false;
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 16.h),
        Text(
          widget.label,
          textDirection: TextDirection.rtl,
          style: AppTextStyles.label,
        ),
        SizedBox(height: 8.h),
        Focus(
          onFocusChange: (hasFocus) => setState(() => _isFocused = hasFocus),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: AppColors.inputBackground,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: _isFocused
                    ? AppColors.inputFocusBorder
                    : AppColors.inputBorder,
                width: _isFocused ? 1.5 : 1,
              ),
              boxShadow: _isFocused
                  ? [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : [],
            ),
            child: TextFormField(
              controller: widget.controller,
              validator: (value) {
                final error = widget.validator?.call(value);
                setState(() => _errorText = error);
                return null;
              },
              keyboardType: widget.keyboardType,
              obscureText: widget.isPassword ? _obscureText : false,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 14.sp,
                color: AppColors.textPrimary,
              ),
              decoration: InputDecoration(
                errorStyle: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 12.sp,
                  color: AppColors.error,
                ),
                hintText: widget.hint,
                hintStyle: AppTextStyles.hint.copyWith(fontSize: 13.sp),
                hintTextDirection: TextDirection.rtl,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 14.h,
                ),
                prefixIcon: widget.isPassword
                    ? GestureDetector(
                        onTap: () =>
                            setState(() => _obscureText = !_obscureText),
                        child: Icon(
                          _obscureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColors.textHint,
                          size: 20.sp,
                        ),
                      )
                    : widget.prefixIcon,
              ),
            ),
          ),
        ),
        if (_errorText != null) ...[
          SizedBox(height: 6.h),
          Text(
            _errorText!,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 12.sp,
              color: AppColors.error,
            ),
          ),
        ] 
      ],
    );
  }
}
