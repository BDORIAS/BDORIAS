import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba_tecnica/feature/home/domain/entities/form.dart';

import '../../../common/presentation/widgets/defaults.dart';
import '../../../common/presentation/widgets/show_loading_message.dart';
import '../../../core/constants/app_size.dart';
import '../../../core/constants/app_string.dart';
import '../../../core/constants/app_text_editing_controllers.dart';
import '../../../core/utils/app_text_style.dart';
import '../../home/presentation/bloc/home_bloc.dart';

class ProfilePage extends StatefulWidget {
  final FormUser? formUser;
  const ProfilePage({this.formUser});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FormUser? formUser;
  late HomeBloc homeBloc;
  @override
  void initState() {
    homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(GetUserEvent());
    initControllers();
    super.initState();
  }

  @override
  void dispose() {
     disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.getRequestStatus == GetRequestStatus.loading) {
          showLoadingMessage(context, 'Cargando');
        }
        if (state.getRequestStatus == GetRequestStatus.loadSuccess) {
          formUser = state.formUserEntity;
          print("address: ${formUser!.address}");
          TextEditingControllers.nameFormController =
              TextEditingController(text: formUser!.name);
          TextEditingControllers.lastNameFormController =
              TextEditingController(text: formUser!.lastName);
          TextEditingControllers.birthDateFormController =
              TextEditingController(text: formUser!.birthDate);
          TextEditingControllers.addressFormController =
              TextEditingController(text: formUser!.address.first);
              Navigator.pop(context);
        } else {
          TextEditingControllers.nameFormController = TextEditingController();
          TextEditingControllers.lastNameFormController =
              TextEditingController();
          TextEditingControllers.birthDateFormController =
              TextEditingController();
          TextEditingControllers.addressFormController =
              TextEditingController();
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 73.h,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.only(
                      bottomEnd: Radius.circular(AppRadius.r20),
                      bottomStart: Radius.circular(AppRadius.r20))),
              centerTitle: true,
              title: Text("Perfil",
                  style: AppTextStyle.BlinkerSemiBoldWhite(
                    fontSize: AppFontSize.s26,
                  )),
              backgroundColor: Colors.purple,
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: AppHeight.h31),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppWidth.w30),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Alinea los elementos a la izquierda
                    children: [
                      SizedBox(
                        height: AppHeight.h18,
                      ),
                      const Text(
                        'Informacion Formulario',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: AppHeight.h10),
                      Defaults.defaultTextFormField(
                        context: context,
                        controller: TextEditingControllers.nameFormController,
                        prefixIcon: const Icon(Icons.person),
                        labelText: AppStrings.name,
                      ),
                      SizedBox(height: AppHeight.h10),
                      Defaults.defaultTextFormField(
                        context: context,
                        controller:
                            TextEditingControllers.lastNameFormController,
                        prefixIcon: const Icon(Icons.person),
                        labelText: AppStrings.lastName,
                      ),
                      SizedBox(height: AppHeight.h10),
                      Defaults.defaultTextFormField(
                        context: context,
                        controller:
                            TextEditingControllers.birthDateFormController,
                        prefixIcon: Icon(
                          Icons.brightness_high_outlined,
                          size: AppHeight.h12,
                        ),
                        labelText: AppStrings.birthDate,
                      ),
                      SizedBox(height: AppHeight.h10),
                      Defaults.defaultTextFormField(
                        context: context,
                        controller:
                            TextEditingControllers.addressFormController,
                        prefixIcon: const Icon(Icons.location_city),
                        labelText: AppStrings.adress,
                      ),
                      SizedBox(height: AppHeight.h10),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void initControllers() {
    TextEditingControllers.nameFormController = TextEditingController(text: ' ');
    TextEditingControllers.lastNameFormController = TextEditingController(text: ' ');
    TextEditingControllers.birthDateFormController = TextEditingController(text: ' ');
    TextEditingControllers.addressFormController = TextEditingController(text: ' ');
  }

  void disposeControllers() {
    TextEditingControllers.nameFormController.dispose();
    TextEditingControllers.lastNameFormController.dispose();
    TextEditingControllers.birthDateFormController.dispose();
    TextEditingControllers.addressFormController.dispose();
  }
}
