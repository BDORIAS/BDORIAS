import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/usercases/usercases.dart';
import '../contracts/home_contracts.dart';
import '../entities/form.dart';

class GetUserUseCase extends BaseUsecase<FormUser, NoParams> {
  final HomeContracts homeContracts;

  GetUserUseCase(this.homeContracts);
  @override
  Future<Either<GenericException, FormUser>> call(NoParams noParams) async {
    return await homeContracts.getUser();
  }
}
