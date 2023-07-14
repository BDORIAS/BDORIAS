import 'package:flutter/material.dart';

import '../../../../../common/presentation/widgets/defaults.dart';
import '../../../../../core/constants/app_size.dart';
import '../../../../../core/constants/app_string.dart';
import '../../../../../core/utils/app_text_style.dart';

class HaveAccountWidget extends StatelessWidget {
  const HaveAccountWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            AppStrings.haveAnAccount,
            style: AppTextStyle.SignikaRegularWhite(fontSize: AppFontSize.s16),
          ),
        ),
        Defaults.defaultTextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            AppStrings.loginNow,
            style: AppTextStyle.SignikaRegularWhite(fontSize: AppFontSize.s16),
          ),
        )
      ],
    );
  }
}
