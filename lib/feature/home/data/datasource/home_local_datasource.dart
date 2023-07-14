import 'dart:convert';

import '../../../../core/constants/app_string.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/local/shared_preferences.dart';
import '../../domain/usercases/create_user_usercase.dart';
import '../model/form_model.dart';

abstract class HomeLocalDataSourceContract {
  Future<FormModel> getForm();
  Future<bool> saveForm({required CreateUserParams createFormUserParams});
}

class HomeLocalDataSource implements HomeLocalDataSourceContract {
  final PreferenceHelper _preferenceHelper;
  HomeLocalDataSource(this._preferenceHelper);

  @override
  Future<bool> saveForm({required CreateUserParams createFormUserParams}) async {
    print("Datos de saveFomr: ${createFormUserParams.name}");
    print("Datos de saveFomr: ${createFormUserParams}");
    await _preferenceHelper.saveDataInSharedPreference(
        key: AppStrings.saveForm,
        value: json.encode(createFormUserParams.toJson()));

    return true;
  }

 
  @override
  Future<FormModel> getForm() async {
    try {
      if (await _preferenceHelper.contains(key: AppStrings.saveForm)) {
        String dataJson = _preferenceHelper.getDataFromSharedPreference(
            key: AppStrings.saveForm) as String;
        print("Resultado del GetForm del localdatasource: $dataJson");
        FormModel formModel = FormModel.fromJson(jsonDecode(dataJson));
        return formModel;
      } else {
        throw CacheException();
      }
    } on Exception {
      throw CacheException();
    }
  }
}
