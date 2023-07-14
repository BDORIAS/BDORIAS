import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../common/domain/entities/user.dart';
import '../../domain/usercases/login_usercases.dart';
import '../../domain/usercases/signup_usercases.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;
  final SignUpUsecase signUpUsecase;
  AuthBloc({
    required this.loginUsecase,
    required this.signUpUsecase,
  }) : super(AuthState()) {
    on<LoginPasswordHideEvent>(_loginPasswordHide);
    on<SignupPasswordHideEvent>(_signUpPasswordHide);
    on<SignupEvent>(_signup);
    on<LoginEvent>(_login);
    on<AuthRequestStatusResset>(_resetAuthRequestStatus);
  }

  FutureOr<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(loginRequestStatus: LoginRequestStatus.loading));
    final result = await loginUsecase(LoginParams(event.email, event.password));
    result.fold((l) {
      emit(state.copyWith(
          loginRequestStatus: LoginRequestStatus.error,
          errorMessage: l.message));
    }, (r) {
      emit(state.copyWith(
          loginRequestStatus: LoginRequestStatus.loginSuccess,
          userEntity: r,
          errorMessage: ''));
    });
  }

  FutureOr<void> _signup(SignupEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(signUpRequestStatus: SignUpRequestStatus.loading));
    final result = await signUpUsecase(SignUpParams(
        email: event.email, password: event.password, name: event.name));
    result.fold((l) {
      emit(state.copyWith(
          signUpRequestStatus: SignUpRequestStatus.error,
          errorMessage: l.message));
    }, (r) {
      add(LoginEvent(event.email, event.password));

      emit(state.copyWith(
          signUpRequestStatus: SignUpRequestStatus.signUpSuccess,
          // userEntity: r,
          errorMessage: ''));
    });
  }

  FutureOr<void> _loginPasswordHide(
      LoginPasswordHideEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoginPasswordHide: event.isHide));
  }

  FutureOr<void> _signUpPasswordHide(
      SignupPasswordHideEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(isSignupPasswordHide: event.isHide));
  }

  FutureOr<void> _resetAuthRequestStatus(
      AuthRequestStatusResset event, Emitter<AuthState> emit) async {
    emit(
      state.copyWith(
        loginRequestStatus: LoginRequestStatus.idle,
        signUpRequestStatus: SignUpRequestStatus.idle,
        forgetPasswordRequestStatus: ForgetPasswordRequestStatus.idle,
      ),
    );
  }
}
