import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qa3a_owner/features/auth/sign_on/presentation/manager/sign_in_cubit.dart';
import 'package:qa3a_owner/features/auth/sign_on/presentation/manager/sign_in_state.dart';
import 'package:qa3a_owner/features/auth/widgets/auth_button.dart';
import 'package:qa3a_owner/features/auth/widgets/auth_text_field.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        key: const ValueKey('signin'),
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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

          // Password
          AuthTextField(
            label: 'كلمة المرور',
            hint: 'ادخل كلمة المرور',
            isPassword: true,
            controller: _passwordController,
            validator: (v) {
              if (v == null || v.isEmpty) return 'كلمة المرور مطلوبة';
              if (v.length < 6) return 'كلمة المرور قصيرة جداً';
              return null;
            },
          ),

          SizedBox(height: 28.h),

          // Sign In button
          BlocBuilder<SignInCubit, SignInState>(
            builder: (context, state) {
              return AuthButton(
                text: 'تسجيل دخول',
                isLoading: state is SignInLoading,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<SignInCubit>().signIn(
                      email: _emailController.text,
                      password: _passwordController.text,
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
