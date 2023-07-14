import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba_tecnica/common/domain/entities/user.dart';

import '../../../../core/constants/app_size.dart';
import '../../../../core/constants/app_string.dart';
import '../../../../core/utils/app_text_style.dart';
import '../bloc/home_bloc.dart';
import '../widgets/create_button_desing.dart';
import '../widgets/home_form_widget.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController pageController = PageController();
  HomeBloc? homeBloc;
  @override
  void initState() {
    homeBloc = BlocProvider.of<HomeBloc>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            toolbarHeight: 73.h,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(AppRadius.r20),
                    bottomStart: Radius.circular(AppRadius.r20))),
            centerTitle: true,
            title: Text("Formulario",
                style: AppTextStyle.BlinkerSemiBoldWhite(
                  fontSize: AppFontSize.s26,
                )),
            backgroundColor: Colors.purple,
          ),
          // backgroundColor: Colors.blue,

          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppWidth.w30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: AppHeight.h10),
                  HomeFormWidget(),
                  SizedBox(height: 30.h),
                  Center(
                    child: Container(
                        width: AppWidth.w123,
                        height: AppHeight.h31,
                        child:  CreateUserButtonDesign(
                          text: AppStrings.create,
                        )),
                  ),
                  SizedBox(height: AppHeight.h31),
                ],
              ),
            ),
          ));
    });
  }
}
