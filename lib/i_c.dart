import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:prueba_tecnica/common/data/datasources/common_remote_data_source.dart';
import 'package:prueba_tecnica/common/domain/usercases/get_data_user.dart';
import 'package:prueba_tecnica/common/domain/usercases/get_user.dart';
import 'package:prueba_tecnica/common/presentation/bloc/common_bloc.dart';
import 'package:prueba_tecnica/feature/home/domain/usercases/create_user_usercase.dart';
import 'package:prueba_tecnica/feature/home/domain/usercases/get_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/data/datasources/common_local_data_source.dart';
import 'common/data/repositories/common_repository.dart';
import 'common/domain/contracts/common_contracts.dart';
import 'core/local/shared_preferences.dart';
import 'core/network/network_info.dart';
import 'feature/auth/data/datasources/auth_local_data_source.dart';
import 'feature/auth/data/datasources/auth_remote_datasource.dart';
import 'feature/auth/data/repositories/auth_repositories.dart';
import 'feature/auth/domain/contracts/auth_contracts.dart';
import 'feature/auth/domain/usercases/login_usercases.dart';
import 'feature/auth/domain/usercases/signup_usercases.dart';
import 'feature/auth/presentation/bloc/auth_bloc.dart';
import 'feature/home/data/datasource/home_local_datasource.dart';
import 'feature/home/data/datasource/home_remote_datasource.dart';
import 'feature/home/data/reporsitory/home_repository.dart';
import 'feature/home/domain/contracts/home_contracts.dart';
import 'feature/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => AuthBloc(loginUsecase: sl(), signUpUsecase: sl()));
  sl.registerFactory(() => CommonBloc(
        getDataUser: sl(),
        getUser: sl(),
      ));
  sl.registerFactory(
      () => HomeBloc(createUserUsecase: sl(), getUserUseCase: sl()));

  sl.registerLazySingleton(() => SignUpUsecase(sl()));
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => GetUser(sl()));
  sl.registerLazySingleton(() => GetDataUser(sl()));

  sl.registerLazySingleton(() => CreateUserUsecase(sl()));
  sl.registerLazySingleton(() => GetUserUseCase(sl()));

  sl.registerLazySingleton<AuthContracts>(() => AuthRepository(
      networkInfo: sl(),
      authLocalDataSource: sl(),
      authRemoteDataSource: sl(),
      commonLocalDataSourceContract: sl()));

  sl.registerLazySingleton<CommonContrats>(() => CommonRepositoryImpl(
      networkInfo: sl(),
      commonLocalDataSourceContract: sl(),
      commonRemoteDataSourceContract: sl()));

  sl.registerLazySingleton<HomeContracts>(() => HomeRepositoryImpl(
      homeLocalDataSourceContract: sl(), homeRemoteDataSourceContract: sl()));

  sl.registerLazySingleton<CommonLocalDataSourceContract>(
      () => CommonLocalDataSource(sl()));
  sl.registerLazySingleton<CommonRemoteDataSourceContract>(
      () => CommonRemoteDataSource(client: sl()));

  sl.registerLazySingleton<AuthLocalDataSourceContract>(
      () => AuthLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<AuthRemoteDataSourceContract>(
    () => AuthRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<HomeLocalDataSourceContract>(
      () => HomeLocalDataSource(sl()));
  sl.registerLazySingleton<HomeRemoteDataSourceContract>(
    () => HomeRemoteDataSource(client: sl()),
  );

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton<PreferenceHelper>(
      () => PreferenceHelper(sharedPreferences: sl()));

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
