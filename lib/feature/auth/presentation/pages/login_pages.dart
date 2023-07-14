import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/presentation/widgets/defaults.dart';
import '../../../../core/constants/app_path.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/constants/app_string.dart';
import '../../../../core/utils/app_text_style.dart';
import '../widgets/dont_have_account_widget.dart';
import '../widgets/login_button_widget.dart';
import '../widgets/login_form_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  bool isSigninIn = false;
  bool isSigninInGoogle = false;

  @override
  Widget build(BuildContext context) {
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
                children: <Widget>[
                  SizedBox(
                    height: AppHeight.h57,
                  ),
                  Image.asset(
                    AssetsPath.loginImage,
                    height: AppHeight.h100,
                  ),
                  SizedBox(height: AppHeight.h13),
                  // Letras Bienvenido, ingresa a tu cuenta
                  Container(
                    alignment: Alignment.center,
                    child: Text(AppStrings.Bienvenido,
                        style: AppTextStyle.BlinkerBoldWhite(
                          fontSize: AppFontSize.s26,
                        )),
                  ),
                  Text('Ingresa a tu cuenta',
                      style: AppTextStyle.BlinkerRegularWhite(
                          fontSize: AppFontSize.s18)),

                  SizedBox(height: AppHeight.h34),
                  const LoginFormWidget(),
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Defaults.defaultTextButton(
                      onPressed: () {
                       
                      },
                      child: Text(AppStrings.forgotPassword,
                          style: AppTextStyle.SignikaRegularWhite(
                              fontSize: AppFontSize.s16)),
                    ),
                  ),
                  SizedBox(height: AppHeight.h18),
                  const LoginButtonWidget(),
                  SizedBox(height: AppHeight.h44),

                  const DontHaveAccountWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
