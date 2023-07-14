import 'package:dartz/dartz.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/usercases/usercases.dart';
import '../contracts/common_contracts.dart';
import '../entities/user.dart';

class GetUser extends BaseUsecase<User, NoParams> {
  final CommonContrats repository;

  GetUser(this.repository);

  Future<Either<GenericException, User>> call(NoParams noParams) {
    return repository.getUser();
  }
}
