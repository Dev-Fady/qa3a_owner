import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qa3a_owner/features/auth/sign_on/presentation/manager/sign_in_cubit.dart';
import 'package:qa3a_owner/features/auth/sign_on/presentation/manager/sign_in_state.dart';
import 'package:qa3a_owner/features/auth/sign_on/presentation/screen/widget/sign_in_body.dart';

class SignOnScreen extends StatelessWidget {
  const SignOnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: BlocListener<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('تم تسجيل الدخول بنجاح')),
            );
          } else if (state is SignInError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },

        child: const SignInBody(),
      ),
    );
  }
}
