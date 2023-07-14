import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/usercases/usercases.dart';
import '../contracts/home_contracts.dart';

class CreateUserUsecase extends BaseUsecase<bool, CreateUserParams> {
  final HomeContracts homeContracts;

  CreateUserUsecase(this.homeContracts);
  @override
  Future<Either<GenericException, bool>> call(CreateUserParams params) async {
    return await homeContracts.saveUser(params);
  }
}

class CreateUserParams extends Equatable {
  final String name;
  final String lastName;
  final String birthDate;
  final List<String> address;

  const CreateUserParams(
      {required this.name,
      required this.lastName,
      required this.birthDate,
      required this.address});

  @override
  List<Object?> get props => [name, lastName, birthDate, address];

  Map<String, dynamic> toJson() => {
        "name": name,
        "lastName": lastName,
        "birthDate": birthDate,
        "address": address
      };
}
