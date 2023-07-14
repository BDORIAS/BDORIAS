import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/presentation/widgets/defaults.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/constants/app_string.dart';
import '../../../../core/constants/app_text_editing_controllers.dart';

final GlobalKey<FormState> formUserKey = GlobalKey<FormState>();

class HomeFormWidget extends StatefulWidget {
  const HomeFormWidget({Key? key}) : super(key: key);

  @override
  State<HomeFormWidget> createState() => _HomeFormWidgetState();
}

class _HomeFormWidgetState extends State<HomeFormWidget> {
  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
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
    // final authBloc = BlocProvider.of<HomeBloc>(context);

    return Form(
      key: formUserKey,
      child: Column(
        children: <Widget>[
          SizedBox(height: 50.h),
          Defaults.defaultTextFormField(
            validator: (value) {
              if (value!.isEmpty || value == '') {
                return 'El campo no puede estar vacío';
              }
              return null;
            },
            context: context,
            controller: TextEditingControllers.nameFormController,
            labelText: AppStrings.name,
            labelStyle: Theme.of(context).textTheme.titleMedium,
            // prefixIcon: const Icon(Icons.email),
          ),
          SizedBox(height: 30.h),
          Defaults.defaultTextFormField(
            validator: (value) {
              if (value!.isEmpty || value == '') {
                return 'El campo no puede estar vacío';
              }
              return null;
            },
            context: context,
            controller: TextEditingControllers.lastNameFormController,
            labelText: AppStrings.lastName,
            labelStyle: Theme.of(context).textTheme.titleMedium,
            // prefixIcon: const Icon(Icons.email),
          ),
          SizedBox(height: 30.h),
          Defaults.defaultTextFormField(
            onTap: () {
              _selectDate(context);
            },
            readOnly: true,
            prefixIcon: Icon(Icons.date_range_sharp),
            validator: (value) {
              if (value!.isEmpty || value == '') {
                return 'El campo no puede estar vacío';
              }
              return null;
            },

            context: context,
            controller: TextEditingControllers.birthDateFormController,
            labelText: AppStrings.birthDate,
            labelStyle: Theme.of(context).textTheme.titleMedium,
            // prefixIcon: const Icon(Icons.email),
          ),
          SizedBox(height: 30.h),
          Defaults.defaultTextFormField(
            
            validator: (value) {
              if (value!.isEmpty || value == '') {
                return 'El campo no puede estar vacío';
              }
              return null;
            },
            context: context,
            controller: TextEditingControllers.addressFormController,
            labelText: AppStrings.adress,
            labelStyle: Theme.of(context).textTheme.titleMedium,
            // prefixIcon: const Icon(Icons.email),
          ),

          SizedBox(height: AppHeight.h18),

          // ForgotPassword(),
        ],
      ),
    );
  }

  void initControllers() {
    TextEditingControllers.nameFormController = TextEditingController();
    TextEditingControllers.lastNameFormController = TextEditingController();
    TextEditingControllers.birthDateFormController = TextEditingController();
    TextEditingControllers.addressFormController = TextEditingController();
  }

  void disposeControllers() {
    TextEditingControllers.nameFormController.dispose();
    TextEditingControllers.lastNameFormController.dispose();
    TextEditingControllers.birthDateFormController.dispose();
    TextEditingControllers.addressFormController.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
      // locale: const Locale("es", "ES"),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        String fecha = pickedDate.day.toString() +
            '-' +
            pickedDate.month.toString() +
            '-' +
            pickedDate.year.toString();

        TextEditingControllers.birthDateFormController.text = fecha;
      });
    }
  }
}
