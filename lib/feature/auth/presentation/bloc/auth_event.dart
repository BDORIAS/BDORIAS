part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

}

class LoginPasswordHideEvent extends AuthEvent {
  final bool isHide;
  const LoginPasswordHideEvent(this.isHide);

  @override
  List<Object?> get props => [isHide];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class SignupEvent extends AuthEvent {
  final String name;
  final String confirmPassword;
  final String email;
  final String password;

  const SignupEvent(this.email, this.password, this.confirmPassword, this.name);

  @override
  List<Object?> get props => [email, password, confirmPassword, name];
}

class SignupPasswordHideEvent extends AuthEvent {
  final bool isHide;
  const SignupPasswordHideEvent(this.isHide);

  @override
  List<Object?> get props => [isHide];
}

class AuthRequestStatusResset extends AuthEvent {
  @override
  List<Object?> get props => [];
}