import 'package:dartz/dartz.dart';

import '../../../core/error/exceptions.dart';
import '../entities/user.dart';

abstract class CommonContrats {
  Future<Either<GenericException, User>> getUser();
  // Future<Either<GenericException, bool>> uploadPhoto(
  //     {required String id, required String name, required String file});
  Future<Either<GenericException, User>> getDataUser({required String id});
}
