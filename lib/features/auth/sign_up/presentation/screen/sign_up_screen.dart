import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qa3a_owner/config/routes/router_name.dart';
import 'package:qa3a_owner/features/auth/sign_up/presentation/manager/sign_up_cubit.dart';
import 'package:qa3a_owner/features/auth/sign_up/presentation/manager/sign_up_state.dart';
import 'package:qa3a_owner/features/auth/sign_up/presentation/screen/widget/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpCubit(),
      child: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('تم إنشاء الحساب بنجاح')),
            );
            GoRouter.of(context).pushReplacementNamed(RouterName.authScreen);
          }

          if (state is SignUpError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: const SignUpBody(),
      ),
    );
  }
}
