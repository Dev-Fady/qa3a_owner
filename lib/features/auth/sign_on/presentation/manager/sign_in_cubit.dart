import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qa3a_owner/features/auth/sign_on/presentation/manager/sign_in_state.dart';


class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  Future<void> signIn({required String email, required String password}) async {
    emit(SignInLoading());
    try {
      // Logic for Sign In
      await Future.delayed(const Duration(seconds: 2));
      emit(SignInSuccess());
    } catch (e) {
      emit(SignInError(e.toString()));
    }
  }
}
