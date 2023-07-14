import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_string.dart';
import '../../../../core/constants/app_toast.dart';
import '../../../../core/route/navigator_utils.dart';
import '../bloc/home_bloc.dart';
import 'create_button_desing.dart';

class CreateUserButtonWidget extends StatelessWidget {
  const CreateUserButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
      if (state.createRequestStatus == CreateRequestStatus.loadSuccess) {
        flutterToast(
          msg: AppStrings.createdUser,
          backgroundColor: AppColors.toastSuccess,
          textColor: AppColors.white,
        );
        homeBloc.add(HomeRequestStatusResset());
        mainPageNavigator(context);
      } else if (state.createRequestStatus == CreateRequestStatus.error) {
        homeBloc.add(HomeRequestStatusResset());

        flutterToast(
          msg: state.errorMessage,
          backgroundColor: AppColors.toastError,
          textColor: AppColors.white,
        );
      }
    }, builder: (context, state) {
      switch (state.createRequestStatus) {
        case CreateRequestStatus.idle:
          return  CreateUserButtonDesign();
        case CreateRequestStatus.loading:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case CreateRequestStatus.loadSuccess:
          return  CreateUserButtonDesign();
        case CreateRequestStatus.cachedSuccess:
          return  CreateUserButtonDesign();
        case CreateRequestStatus.error:
          return  CreateUserButtonDesign();
      }
    });
  }
}
