import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/presentation/widgets/defaults.dart';
import '../../../../../core/constants/app_size.dart';
import '../../../../../core/constants/app_string.dart';
import '../../../../../core/constants/app_text_editing_controllers.dart';
import '../../../../../core/validationHelper/validation_helper.dart';
import '../../bloc/auth_bloc.dart';

GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

class SignUpTextFieldsWidget extends StatefulWidget {
  const SignUpTextFieldsWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpTextFieldsWidget> createState() => _SignUpTextFieldsWidgetState();
}

class _SignUpTextFieldsWidgetState extends State<SignUpTextFieldsWidget> {
  @override
  void initState() {
    super.initState();
    initControllers();
  }

  @override
  void dispose() {
    disposeControllers();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    return Form(
      key: signUpFormKey,
      child: Column(
        children: [
          Defaults.defaultTextFormField(
            context: context,
            controller: TextEditingControllers.signUpNameController,
            prefixIcon: const Icon(Icons.person),
            labelText: AppStrings.nameApellidos,
          ),
          SizedBox(height: AppHeight.h10),
          Defaults.defaultTextFormField(
            validator: (value) => ValidationHelper.validateEmail(value: value),
            context: context,
            controller: TextEditingControllers.signUpEmailController,
            prefixIcon: const Icon(Icons.email),
            labelText: AppStrings.email,
          ),
          SizedBox(height: AppHeight.h10),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) => Defaults.defaultTextFormField(
              context: context,
              validator: (value) =>
                  ValidationHelper.validatePassword(value: value),
              controller: TextEditingControllers.signUpPasswordController,
              prefixIcon: const Icon(Icons.lock),
              labelText: AppStrings.password,
              obscureText: state.isSignupPasswordHide,
              suffixIcon: IconButton(
                icon: Icon(state.isSignupPasswordHide
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: () {
                  authBloc.add(
                      SignupPasswordHideEvent(!state.isSignupPasswordHide));
                },
              ),
            ),
          ),
          SizedBox(height: AppHeight.h10),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) => Defaults.defaultTextFormField(
              context: context,
              controller:
                  TextEditingControllers.signUpPasswordConfirmController,
              labelText: AppStrings.confirmPassword,
              validator: (value) => ValidationHelper.validatePassowrdConfirm(
                  confirmPassword: value,
                  password:
                      TextEditingControllers.signUpPasswordController.text),
              prefixIcon: const Icon(Icons.lock),
              obscureText: state.isSignupPasswordHide,
              suffixIcon: IconButton(
                icon: Icon(
                  state.isSignupPasswordHide
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () {
                  authBloc.add(
                      SignupPasswordHideEvent(!state.isSignupPasswordHide));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void initControllers() {
    TextEditingControllers.signUpNameController = TextEditingController();
    TextEditingControllers.signUpEmailController = TextEditingController();
    TextEditingControllers.signUpPasswordController = TextEditingController();
    TextEditingControllers.signUpPasswordConfirmController =
        TextEditingController();
  }

  void disposeControllers() {
    TextEditingControllers.signUpNameController.dispose();
    TextEditingControllers.signUpEmailController.dispose();
    TextEditingControllers.signUpPasswordController.dispose();
    TextEditingControllers.signUpPasswordConfirmController.dispose();
  }
}
