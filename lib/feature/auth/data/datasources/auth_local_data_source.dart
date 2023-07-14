import '../../../../core/constants/app_string.dart';
import '../../../../core/local/shared_preferences.dart';

abstract class AuthLocalDataSourceContract {
  Future<void> clearCache();
  Future<void> cacheIsUserLogging();
  Future<void> cacheGetUserLogging();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSourceContract {
  final PreferenceHelper _preferenceHelper;

  AuthLocalDataSourceImpl(
    this._preferenceHelper,
  );

  @override
  Future<void> clearCache() async {
    _preferenceHelper.clearData();
  }

  @override
  Future<void> cacheIsUserLogging() async {
    _preferenceHelper.saveDataInSharedPreference(
        key: AppStrings.cachedIsAuthenticated, value: true);
  }

  @override
  Future<void> cacheGetUserLogging() async {
    _preferenceHelper.getDataFromSharedPreference(key: "saveUser");
  }
}
