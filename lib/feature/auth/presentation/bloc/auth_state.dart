part of 'auth_bloc.dart';

enum LoginRequestStatus { idle, loading, loginSuccess, cachedSuccess, error }

enum SignUpRequestStatus { idle, loading, signUpSuccess, cachedSuccess, error }

enum ForgetPasswordRequestStatus { idle, loading, success, error }

class AuthState extends Equatable {
  final bool isLoginPasswordHide;
  final bool isSignupPasswordHide;
  final LoginRequestStatus loginRequestStatus;
  final SignUpRequestStatus signUpRequestStatus;
  final ForgetPasswordRequestStatus forgetPasswordRequestStatus;
  final User? userEntity;
  final String errorMessage;
  const AuthState({
    this.isLoginPasswordHide = true,
    this.isSignupPasswordHide = true,
    this.loginRequestStatus = LoginRequestStatus.idle,
    this.signUpRequestStatus = SignUpRequestStatus.idle,
    this.forgetPasswordRequestStatus = ForgetPasswordRequestStatus.idle,
    this.errorMessage = '',
    this.userEntity,
  });

  AuthState copyWith({
    bool? isLoginPasswordHide,
    bool? isSignupPasswordHide,
    LoginRequestStatus? loginRequestStatus,
    SignUpRequestStatus? signUpRequestStatus,
    ForgetPasswordRequestStatus? forgetPasswordRequestStatus,
    String? errorMessage,
    User? userEntity,
  }) {
    return AuthState(
      isLoginPasswordHide: isLoginPasswordHide ?? this.isLoginPasswordHide,
      isSignupPasswordHide: isSignupPasswordHide ?? this.isSignupPasswordHide,
      loginRequestStatus: loginRequestStatus ?? this.loginRequestStatus,
      signUpRequestStatus: signUpRequestStatus ?? this.signUpRequestStatus,
      forgetPasswordRequestStatus:
          forgetPasswordRequestStatus ?? this.forgetPasswordRequestStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      userEntity: userEntity ?? this.userEntity,
    );
  }

  @override
  List<Object> get props => [
        isLoginPasswordHide,
        isSignupPasswordHide,
        loginRequestStatus,
        signUpRequestStatus,
        forgetPasswordRequestStatus,
        errorMessage,
      ];
}
