import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica/feature/home/domain/entities/form.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/contracts/home_contracts.dart';
import '../../domain/usercases/create_user_usercase.dart';
import '../datasource/home_local_datasource.dart';
import '../datasource/home_remote_datasource.dart';

class HomeRepositoryImpl implements HomeContracts {
  final HomeLocalDataSourceContract homeLocalDataSourceContract;
  final HomeRemoteDataSourceContract homeRemoteDataSourceContract;

  HomeRepositoryImpl({
    required this.homeLocalDataSourceContract,
    required this.homeRemoteDataSourceContract,
  });

  @override
  Future<Either<GenericException, bool>> saveUser(CreateUserParams createFormUserParams) async {
    try {
      final user = await homeLocalDataSourceContract.saveForm(createFormUserParams:  createFormUserParams);
      return Right(user);
    } on GenericException catch (exception) {
      return Left(exception);
    }
  }

  @override
  Future<Either<GenericException, FormUser>> getUser() async {
    try {
      final user = await homeLocalDataSourceContract.getForm();
      return Right(user);
    } on GenericException catch (exception) {
      return Left(exception);
    }
  }

  
}
