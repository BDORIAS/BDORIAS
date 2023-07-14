import 'dart:convert';

import 'package:prueba_tecnica/feature/auth/domain/usercases/signup_usercases.dart';

import '../../../core/constants/app_string.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/local/shared_preferences.dart';
import '../models/user_model.dart';

abstract class CommonLocalDataSourceContract {
  Future<UserModel> getUser();
  Future<bool> saveUser({required SignUpParams signUpParams});
  // Future<UserModel> getDataUser({required String id});
}

class CommonLocalDataSource implements CommonLocalDataSourceContract {
  final PreferenceHelper _preferenceHelper;
  CommonLocalDataSource(this._preferenceHelper);

  @override
  Future<UserModel> getUser() async {
    try {
      if (await _preferenceHelper.contains(key: AppStrings.saveUser)) {
        String dataJson = _preferenceHelper.getDataFromSharedPreference(
            key: AppStrings.saveUser) as String;

        UserModel userModel = UserModel.fromJson(jsonDecode(dataJson));
        return userModel;
      } else {
        throw const CacheException();
      }
    } on Exception {
      throw const CacheException();
    }
  }

  @override
  Future<bool> saveUser({required SignUpParams signUpParams}) async {
    await _preferenceHelper.saveDataInSharedPreference(
        key: AppStrings.saveUser, value: json.encode(signUpParams.toJson()));

    return true;
  }

  // @override
  // Future<UserModel> getDataUser({required String id}) {
  //   // TODO: implement getDataUser
  //   throw UnimplementedError();
  // }
}
