import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../entities/form.dart';
import '../usercases/create_user_usercase.dart';

abstract class HomeContracts {
  Future<Either<GenericException, bool>> saveUser(CreateUserParams createFormUserParams);
  Future<Either<GenericException, FormUser>> getUser();
}
