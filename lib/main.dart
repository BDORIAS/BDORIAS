import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba_tecnica/common/presentation/bloc/common_bloc.dart';
import 'package:prueba_tecnica/core/route/on_generate_route.dart';
import '/i_c.dart' as di;
import 'core/constants/app_colors.dart';
import 'core/route/page_const.dart';
import 'feature/auth/presentation/bloc/auth_bloc.dart';
import 'feature/home/presentation/bloc/home_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => di.sl<AuthBloc>()),
        BlocProvider<CommonBloc>(create: (_) => di.sl<CommonBloc>()),
        BlocProvider<HomeBloc>(create: (_) => di.sl<HomeBloc>()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(375, 667),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              title: 'Prueba 1',
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [const Locale('es')],
              theme: ThemeData(
                scaffoldBackgroundColor: AppColors.background,
              ),
              onGenerateRoute: OnGenerateRoute.route,
              initialRoute: PageConst.splashPage,
            );
          }),
    );
  }
}
