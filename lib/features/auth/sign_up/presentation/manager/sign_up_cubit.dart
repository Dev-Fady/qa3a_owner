import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qa3a_owner/features/auth/sign_up/presentation/manager/sign_up_state.dart';


class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<void> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    emit(SignUpLoading());
    try {
      // Logic for Sign Up
      await Future.delayed(const Duration(seconds: 2));
      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpError(e.toString()));
    }
  }
}
