import 'package:flutter/material.dart';
import 'package:prueba_tecnica/common/presentation/pages/main_page.dart';
import 'package:prueba_tecnica/core/route/page_const.dart';

import '../../common/presentation/pages/splash_screen.dart';
import '../../feature/auth/presentation/pages/login_pages.dart';
import '../../feature/auth/presentation/pages/register_pages.dart';
import '../../feature/user/presentation/porfile_page.dart';

class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {

    switch (settings.name) {
      case PageConst.splashPage:
        {
          return routeBuilder(SplashScreen());
        }
      case PageConst.loginPage:
        {
          return routeBuilder(LoginPage());
        }
      case PageConst.registerPage:
        {
          return routeBuilder(RegisterPage());
        }
      case PageConst.profileScreen:
        {
          return routeBuilder(ProfilePage());
        }
      case PageConst.mainScreen:
        {
          return routeBuilder(MainPage(
              ));
        }
      //Inicio

      default:
        {
          return routeBuilder(const NoPageFound());
        }
    }
  }
}

dynamic routeBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

class NoPageFound extends StatelessWidget {
  const NoPageFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Not found'),
      ),
      body: const Center(
        child: Text('Page Not found'),
      ),
    );
  }
}
