
import 'package:flutter/material.dart';
import 'package:prueba_tecnica/core/route/page_const.dart';

Future pushNamed(
    {required BuildContext context,
    required String PageConst,
    Object? arg}) async {
  await Navigator.pushNamed(context, PageConst, arguments: arg);
}

Future mainPageNavigator(BuildContext context) async {
  await Navigator.pushReplacementNamed(context, PageConst.mainScreen);
}