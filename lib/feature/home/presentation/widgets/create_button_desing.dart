import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/feature/home/presentation/bloc/home_bloc.dart';

import '../../../../common/presentation/widgets/defaults.dart';
import '../../../../core/constants/app_text_editing_controllers.dart';
import '../../domain/entities/form.dart';
import 'home_form_widget.dart';

class CreateUserButtonDesign extends StatelessWidget {
  final String? text;
  final List<String> address = [];
  CreateUserButtonDesign({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeBloc = BlocProvider.of<HomeBloc>(context);

    return Container(
      width: double.infinity,
      child: Defaults.defaultButton(
        text: text,
        onPressed: () {
          if (formUserKey.currentState!.validate()) {
            address.add(TextEditingControllers.addressFormController.text);
            FormUser formUser = FormUser(
              name: TextEditingControllers.nameFormController.text,
              lastName: TextEditingControllers.lastNameFormController.text,
              birthDate: TextEditingControllers.birthDateFormController.text,
              address: address,
            );
            homeBloc.add(
              CreateUserEvent(formUser),
            );
          }
        },
        context: context,
      ),
    );
  }
}
