import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/feature/auth/presentation/widgets/register_widgets/sign_up_button_design.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_string.dart';
import '../../../../../core/constants/app_toast.dart';
import '../../../../../core/route/navigator_utils.dart';
import '../../bloc/auth_bloc.dart';

class SignUpButtonWidget extends StatelessWidget {
  const SignUpButtonWidget({
    Key? key,
    required AuthBloc authBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    return BlocConsumer<AuthBloc, AuthState>(builder: (context, state) {
      switch (state.signUpRequestStatus) {
        case SignUpRequestStatus.idle:
          return const SignUpButtonDesign();
        case SignUpRequestStatus.loading:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case SignUpRequestStatus.signUpSuccess:
          return const SignUpButtonDesign();
        case SignUpRequestStatus.cachedSuccess:
          return const SignUpButtonDesign();
        case SignUpRequestStatus.error:
          return const SignUpButtonDesign();
      }
    }, listener: (context, state) {
      if (state.signUpRequestStatus == SignUpRequestStatus.signUpSuccess) {
        flutterToast(
          msg: AppStrings.Bienvenido,
          backgroundColor: AppColors.toastSuccess,
          textColor: AppColors.white,
        );
        authBloc.add(AuthRequestStatusResset());
        mainPageNavigator(context);
      } else if (state.signUpRequestStatus == SignUpRequestStatus.error) {
        authBloc.add(AuthRequestStatusResset());
        flutterToast(
          msg: state.errorMessage,
          backgroundColor: AppColors.toastError,
          textColor: AppColors.white,
        );
      }
    });
  }
}
