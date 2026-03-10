import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qa3a_owner/features/auth/sign_up/presentation/manager/sign_up_cubit.dart';
import 'package:qa3a_owner/features/auth/sign_up/presentation/manager/sign_up_state.dart';
import 'package:qa3a_owner/features/auth/widgets/auth_button.dart';
import 'package:qa3a_owner/features/auth/widgets/auth_text_field.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        key: const ValueKey('signup'),
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Full Name
          AuthTextField(
            label: 'الاسم كاملاً',
            hint: 'ادخل الاسم كاملاً',
            keyboardType: TextInputType.name,
            controller: _nameController,
            validator: (v) {
              if (v == null || v.isEmpty) return 'الاسم الكامل مطلوب';
              if (v.trim().split(' ').length < 2) {
                return 'يرجى إدخال الاسم الكامل';
              }
              return null;
            },
          ),

          // Email
          AuthTextField(
            label: 'البريد الإلكتروني',
            hint: 'name@example.com',
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            validator: (v) {
              if (v == null || v.isEmpty) return 'البريد الإلكتروني مطلوب';
              if (!v.contains('@')) return 'بريد إلكتروني غير صالح';
              return null;
            },
          ),

          // Phone
          AuthTextField(
            label: 'رقم الهاتف',
            hint: 'ادخل رقم الهاتف',
            keyboardType: TextInputType.phone,
            controller: _phoneController,
            validator: (v) {
              if (v == null || v.isEmpty) return 'رقم الهاتف مطلوب';
              return null;
            },
          ),

          // Password
          AuthTextField(
            label: 'كلمة المرور',
            hint: 'ادخل كلمة المرور',
            isPassword: true,
            controller: _passwordController,
            validator: (v) {
              if (v == null || v.isEmpty) return 'كلمة المرور مطلوبة';
              if (v.length < 6) {
                return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
              }
              return null;
            },
          ),

          // Confirm Password
          AuthTextField(
            label: 'تأكيد كلمة المرور',
            hint: 'ادخل كلمة المرور مرة أخرى',
            isPassword: true,
            controller: _confirmPasswordController,
            validator: (v) {
              if (v == null || v.isEmpty) return 'تأكيد كلمة المرور مطلوب';
              if (v != _passwordController.text) {
                return 'كلمة المرور غير متطابقة';
              }
              return null;
            },
          ),

          SizedBox(height: 28.h),

          // Sign Up button
          BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              return AuthButton(
                text: 'إنشاء الحساب',
                isLoading: state is SignUpLoading,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<SignUpCubit>().signUp(
                      name: _nameController.text,
                      email: _emailController.text,
                      phone: _phoneController.text,
                      password: _passwordController.text,
                      confirmPassword: _confirmPasswordController.text,
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
