import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:prueba_tecnica/core/constants/app_size.dart';

import '../../../core/constants/app_path.dart';
import '../../../core/constants/app_string.dart';
import '../../../core/local/shared_preferences.dart';
import '../../../core/route/navigator_utils.dart';
import '../../../core/route/page_const.dart';
import '../../../i_c.dart';
import '../../data/models/user_model.dart';
import '../bloc/common_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isUserAuthenticated = false;
  String dataJson = '';
  UserModel? userModel;
  late Timer timer;
  _startDelay() {
    timer = Timer(const Duration(milliseconds: 1000), () => _goNext());
  }

  Future _goNext() async => {
        if (_isUserAuthenticated)
          {
            if (await sl<PreferenceHelper>().contains(key: AppStrings.saveUser))
              {
                dataJson = sl<PreferenceHelper>().getDataFromSharedPreference(
                    key: AppStrings.saveUser) as String,
                print("nuevo" + dataJson),
                userModel = UserModel.fromJson(jsonDecode(dataJson)),
                BlocProvider.of<CommonBloc>(context)
                    .add(UserInitialEvent(idUser: userModel!.email!)),
              }

            // mainPageNavigator(context)
          }
        else
          {Navigator.pushReplacementNamed(context, PageConst.loginPage)}
      };

  Future _isUserAuthenticatedCache() async {
    _isUserAuthenticated = sl<PreferenceHelper>()
            .getBoolDataFromSharedPreference(
                key: AppStrings.cachedIsAuthenticated) ??
        false;
  }

  @override
  void initState() {
    _isUserAuthenticatedCache();
    _startDelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final horizontal = size.width * 0.1;
    return BlocListener<CommonBloc, CommonState>(
      listener: (context, state) {
        if (state.getDataUser == GetDataUserState.getDataSuccess) {
          mainPageNavigator(context);
        }
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              HexColor('#FF5A2C91'),
              HexColor('#FF8D359C'),
            ],
          )),
          child: Center(
            child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: horizontal),
                child: Image.asset(
                  AssetsPath.loginImage,
                  // color: Colors.white,
                  // width: AppWidth.w100,
                  height: AppHeight.h100,
                )),
          ),
        ),
      ),
    );
  }
}
