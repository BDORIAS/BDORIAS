import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/presentation/widgets/defaults.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/constants/app_string.dart';
import '../../../../core/constants/app_text_editing_controllers.dart';
import '../bloc/auth_bloc.dart';

final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  @override
  void initState() {
    initControllers();
    super.initState();
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
      key: loginFormKey,
      child: Column(
        children: <Widget>[
          Defaults.defaultTextFormField(
            // validator: (value) => ValidationHelper.validateEmail(value: value),
            context: context,
            controller: TextEditingControllers.loginEmailController,
            labelText: AppStrings.email,
            labelStyle: Theme.of(context).textTheme.titleMedium,
            prefixIcon: const Icon(Icons.email),
          ),

          SizedBox(height: AppHeight.h18),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) => Defaults.defaultTextFormField(
              context: context,
              // validator: (value) =>
              //     ValidationHelper.validatePassword(value: value),
              controller: TextEditingControllers.loginPasswordController,
              labelText: AppStrings.password,
              labelStyle: Theme.of(context).textTheme.titleMedium,
              prefixIcon: const Icon(Icons.lock),
              obscureText: state.isLoginPasswordHide,
              suffixIcon: IconButton(
                icon: Icon(
                  state.isLoginPasswordHide
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () {
                  print(state.isLoginPasswordHide);
                  authBloc
                      .add(LoginPasswordHideEvent(!state.isLoginPasswordHide));
                },
              ),
            ),
          ),
          // ForgotPassword(),
        ],
      ),
    );
  }

  void initControllers() {
    TextEditingControllers.loginEmailController = TextEditingController();
    TextEditingControllers.loginPasswordController = TextEditingController();
  }

  void disposeControllers() {
    TextEditingControllers.loginEmailController.dispose();
    TextEditingControllers.loginPasswordController.dispose();
  }
}
