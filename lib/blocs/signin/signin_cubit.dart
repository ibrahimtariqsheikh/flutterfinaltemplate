import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_template/models/custom_error.dart';
import 'package:final_template/repositories/auth_repository.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepository authRepository;
  SignInCubit({
    required this.authRepository,
  }) : super(SignInState.initial());

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(
      signInStatus: SignInStatus.submitting,
    ));
    try {
      await authRepository.signInWithEmail(email: email, password: password);
      emit(state.copyWith(
        signInStatus: SignInStatus.success,
      ));
    } on CustomError catch (e) {
      emit(state.copyWith(signInStatus: SignInStatus.error, error: e));
    }
  }
}
