

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/presentation/widgets/defaults.dart';
import '../../../../../core/constants/app_string.dart';
import '../../../../../core/constants/app_text_editing_controllers.dart';
import '../../bloc/auth_bloc.dart';
import 'sign_up_textfield_widget.dart';

class SignUpButtonDesign extends StatelessWidget {
  const SignUpButtonDesign({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    return Container(
      width: double.infinity,
      child: Defaults.defaultButton(
        onPressed: () {
          FocusScope.of(context).unfocus();
          if (signUpFormKey.currentState!.validate()) {
            authBloc.add(
              SignupEvent(
                TextEditingControllers.signUpEmailController.text,
                TextEditingControllers.signUpPasswordController.text,
                TextEditingControllers.signUpPasswordConfirmController.text,
                TextEditingControllers.signUpNameController.text,
              ),
            );
          }
        },
        context: context,
        text: AppStrings.signUp,
      ),
    );
  }
}