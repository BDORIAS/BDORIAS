
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_toast.dart';
import '../../../../core/route/navigator_utils.dart';
import '../bloc/auth_bloc.dart';
import 'login_buttn_design.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state.loginRequestStatus == LoginRequestStatus.loginSuccess) {
        authBloc.add(AuthRequestStatusResset());
        mainPageNavigator(context);
      } else if (state.loginRequestStatus == LoginRequestStatus.error) {
        authBloc.add(AuthRequestStatusResset());

        flutterToast(
          msg: state.errorMessage,
          backgroundColor: AppColors.toastError,
          textColor: AppColors.white,
        );
      }
    }, builder: (context, state) {
      switch (state.loginRequestStatus) {
        case LoginRequestStatus.idle:
          return const LoginButtonDesign();
        case LoginRequestStatus.loading:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case LoginRequestStatus.loginSuccess:
          return const LoginButtonDesign();
        case LoginRequestStatus.cachedSuccess:
          return const LoginButtonDesign();
        case LoginRequestStatus.error:
          return const LoginButtonDesign();
      }
    });
  }
}