import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_path.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/constants/app_string.dart';
import '../../../../core/utils/app_text_style.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/register_widgets/have_accoubt_widget.dart';
import '../widgets/register_widgets/sign_up_button_widget.dart';
import '../widgets/register_widgets/sign_up_textfield_widget.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final signUpButtonWidget = SignUpButtonWidget(authBloc: authBloc);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: 1.sw,
            height: 1.sh,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF5A2C91),
                  const Color(0xFF8D359C),
                  Colors.purple.shade100,
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppWidth.w30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // padding: EdgeInsets.symmetric(
                //     horizontal: width * 0.05, vertical: height * 0.1),
                children: <Widget>[
                  SizedBox(height: AppHeight.h46),
                  Image.asset(AssetsPath.loginImage, height: AppHeight.h100),
                  SizedBox(height: AppHeight.h13),
                  Container(
                    alignment: Alignment.center,
                    child: Text(AppStrings.Bienvenido,
                        style: AppTextStyle.BlinkerBoldWhite(
                            fontSize: AppFontSize.s26)),
                  ),
                  Text('Registrate',
                      style: AppTextStyle.BlinkerRegularWhite(
                          fontSize: AppFontSize.s18)),
                  SizedBox(height: AppHeight.h34),
                  SignUpTextFieldsWidget(),
                  SizedBox(height: AppHeight.h10),
                  signUpButtonWidget,
                  SizedBox(height: AppHeight.h10),
                  const HaveAccountWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
