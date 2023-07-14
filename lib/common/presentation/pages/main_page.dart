import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../core/constants/app_colors.dart';
import '../../../feature/home/presentation/pages/home_page.dart';
import '../../../feature/user/presentation/porfile_page.dart';
import '../bloc/common_bloc.dart';

class MainPage extends StatefulWidget {
  final int? currentIndex;
  const MainPage({
    Key? key,
    this.currentIndex,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  int currentIndex = 0;

  late PageController pageController;
  @override
  void initState() {
    BlocProvider.of<CommonBloc>(context).add(StartDataApp());
    pageController = PageController();
    currentIndex = widget.currentIndex == null ? 0 : widget.currentIndex!;

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void navigationTapped(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 80.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(21.r), topLeft: Radius.circular(21.r)),
          boxShadow: const [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(21.r),
            topRight: Radius.circular(21.r),
          ),
          child: BottomNavigationBar(
            iconSize: 28.h,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.iconsPrimary,
            unselectedItemColor: AppColors.iconsGrey,
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "Perfil",
              ),
            ],
            onTap: navigationTapped,
          ),
        ),
      ),
      body: BlocBuilder<CommonBloc, CommonState>(
        builder: (context, state) {
          if (state.user == null) {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              color: HexColor('#13CACE'),
            ));
          }
          return PageView(
            controller: pageController,
            onPageChanged: onPageChanged,
            children: [
              HomePage(user: state.user!),
               ProfilePage(),
            ],
          );
        },
      ),
    );
  }
}
