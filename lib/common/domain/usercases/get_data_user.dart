import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica/common/domain/entities/user.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/usercases/usercases.dart';
import '../contracts/common_contracts.dart';

class GetDataUser extends BaseUsecase<User, String> {
  final CommonContrats commonContrats;
  GetDataUser(this.commonContrats);

  @override
  Future<Either<GenericException, User>> call(String id) async {
    return commonContrats.getDataUser(id: id);
  }
}
