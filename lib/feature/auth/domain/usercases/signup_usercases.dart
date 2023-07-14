import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/usercases/usercases.dart';
import '../contracts/auth_contracts.dart';

class SignUpUsecase extends BaseUsecase<bool, SignUpParams> {
  final AuthContracts authContracts;

  SignUpUsecase(this.authContracts);
  @override
  Future<Either<GenericException, bool>> call(SignUpParams params) async {
    return await authContracts.signUp(params);
  }
}

class SignUpParams extends Equatable {
  final String name;
  final String email;
  final String password;

  const SignUpParams({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [name, email, password];

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
      };
}
