import 'package:flutter/material.dart';

import '../../../../common/presentation/widgets/defaults.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/constants/app_string.dart';
import '../../../../core/route/page_const.dart';
import '../../../../core/utils/app_text_style.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(AppStrings.dontHaveAnAccount,
              style:
                  AppTextStyle.SignikaRegularWhite(fontSize: AppFontSize.s16)),
        ),
        Defaults.defaultTextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(PageConst.registerPage);
          },
          child: Text(AppStrings.signUpNow,
              style:
                  AppTextStyle.SignikaRegularWhite(fontSize: AppFontSize.s16)),
        )
      ],
    );
  }
}
