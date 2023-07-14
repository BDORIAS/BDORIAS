

import '../constants/app_string.dart';

class ValidationHelper {
  static String? validateEmail({
    required String? value,
  }) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());

    if (value == null || value == '') {
      return AppStrings.pleaseEnterYourEmail;
    } else if (!(regex.hasMatch(value))) {
      return AppStrings.invalidEmail;
    } else {
      return null;
    }
  }

  static String? validatePassword({
    required String? value,
  }) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9]).{8,}$');
    if (value == null || value == '') {
      return AppStrings.pleaseEnterYourPassword;
    } else {
      if (!regex.hasMatch(value)) {
        return AppStrings.shouldContainOneUpperCaseDigitAndMinimum8Characters;
      } else {
        return null;
      }
    }
  }

  static String? validatePassowrdConfirm(
      {required String? confirmPassword, required String password}) {
    if (confirmPassword == null || confirmPassword == '') {
      return AppStrings.pleaseEnterYourPasswordAgain;
    } else if (confirmPassword != password) {
      return AppStrings.invalidPassword;
    } else {
      return null;
    }
  }


}