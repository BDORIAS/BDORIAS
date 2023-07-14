import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica/common/data/datasources/common_remote_data_source.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/network_info.dart';
import '../../domain/contracts/common_contracts.dart';
import '../../domain/entities/user.dart';
import '../datasources/common_local_data_source.dart';

class CommonRepositoryImpl implements CommonContrats {
  final NetworkInfo networkInfo;
  final CommonLocalDataSourceContract commonLocalDataSourceContract;
  final CommonRemoteDataSourceContract commonRemoteDataSourceContract;

  CommonRepositoryImpl({
    required this.networkInfo,
    required this.commonLocalDataSourceContract,
    required this.commonRemoteDataSourceContract,
  });

  @override
  Future<Either<GenericException, User>> getUser() async {
    try {
      final user = await commonLocalDataSourceContract.getUser();
      return Right(user);
    } on GenericException catch (exception) {
      return Left(exception);
    }
  }

  @override
  Future<Either<GenericException, User>> getDataUser(
      {required String id}) async {
    try {
      final user = await commonLocalDataSourceContract.getUser();
      return Right(user);
    } on GenericException catch (exception) {
      return Left(exception);
    }
  }

}
