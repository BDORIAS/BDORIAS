
import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica/common/domain/entities/user.dart';

import '../../../../common/data/datasources/common_local_data_source.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/contracts/auth_contracts.dart';
import '../../domain/usercases/login_usercases.dart';
import '../../domain/usercases/signup_usercases.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepository extends AuthContracts {
  final NetworkInfo networkInfo;
  final AuthLocalDataSourceContract authLocalDataSource;
  final AuthRemoteDataSourceContract authRemoteDataSource;
  final CommonLocalDataSourceContract commonLocalDataSourceContract;
  AuthRepository(
      {required this.networkInfo,
      required this.authLocalDataSource,
      required this.authRemoteDataSource,
      required this.commonLocalDataSourceContract});
  @override
  Future<Either<GenericException, bool>> signUp(SignUpParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final result =
            await commonLocalDataSourceContract.saveUser(signUpParams: params);
        await authLocalDataSource.cacheIsUserLogging();
        return Right(result);
      } on GenericException catch (exception) {
        return Left(exception);
      }
    } else {
      return const Left(NoInternetConnectionException());
    }
  }

  @override
  Future<Either<GenericException, User>> login(LoginParams params) async {
    if (await networkInfo.isConnected) {
      try {
     
        final result = await commonLocalDataSourceContract.getUser();
        final cacheUser = authLocalDataSource.cacheGetUserLogging();
        print("---------------------------");
        print("caheUser: $cacheUser");
        
        return Right(result);
      } on GenericException catch (exception) {
        return Left(exception);
      }
    } else {
      return const Left(NoInternetConnectionException());
    }
  }
}
