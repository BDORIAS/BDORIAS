
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../common/domain/entities/user.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/usercases/usercases.dart';
import '../contracts/auth_contracts.dart';

class LoginUsecase extends BaseUsecase<User, LoginParams> {
  final AuthContracts authContracts;

  LoginUsecase(this.authContracts);

  Future<Either<GenericException, User>> call(LoginParams params) {
    return authContracts.login(params);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams(this.email, this.password);

  @override
  List<Object?> get props => [email, password];

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}