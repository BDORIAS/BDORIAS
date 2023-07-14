
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/presentation/widgets/defaults.dart';
import '../../../../core/constants/app_string.dart';
import '../../../../core/constants/app_text_editing_controllers.dart';
import '../bloc/auth_bloc.dart';
import 'login_form_widget.dart';

class LoginButtonDesign extends StatelessWidget {
  const LoginButtonDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authBloc = BlocProvider.of<AuthBloc>(context);
    return Container(
      width: double.infinity,
      child: Defaults.defaultButton(
          onPressed: () {
            if (loginFormKey.currentState!.validate()) {
              authBloc.add(
                LoginEvent(
                  TextEditingControllers.loginEmailController.text.trim(),
                  TextEditingControllers.loginPasswordController.text,
                ),
              );
            }
          },
          context: context,
          text: AppStrings.login),
    );
  }
}