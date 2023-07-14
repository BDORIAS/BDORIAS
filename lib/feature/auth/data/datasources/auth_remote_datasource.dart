



import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../common/data/models/user_model.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/error/response_exception.dart';
import '../../domain/usercases/login_usercases.dart';
import '../../domain/usercases/signup_usercases.dart';

abstract class AuthRemoteDataSourceContract {
  Future<UserModel> signUp(SignUpParams params);
  Future<UserModel> login(LoginParams params);

}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSourceContract {
  final http.Client client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> signUp(SignUpParams params) async {
    final uri = Uri.parse(EndPoints.urlRegisterUser);
    final response = await client.post(uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(params.toJson()));
    final returnresponse = returnResponse(response);
    return UserModel.fromJson(returnresponse);
  }

  @override
  Future<UserModel> login(LoginParams params) async {
    final uri = Uri.parse(EndPoints.urlLogin);
    print(uri);
    var response = await client.post(uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(params.toJson()));
    print(jsonEncode(params.toJson()));
    final returnresponse = returnResponse(response);
    return UserModel.fromJson(returnresponse);
  }



}