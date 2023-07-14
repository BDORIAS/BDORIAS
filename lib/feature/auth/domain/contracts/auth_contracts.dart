import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica/common/domain/entities/user.dart';

import '../../../../core/error/exceptions.dart';
import '../usercases/login_usercases.dart';
import '../usercases/signup_usercases.dart';

abstract class AuthContracts {
  Future<Either<GenericException, bool>> signUp(SignUpParams params);
  Future<Either<GenericException, User>> login(LoginParams params);

}
