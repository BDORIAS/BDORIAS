import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_style.dart';
import '../../../core/constants/app_colors.dart';

void showLoadingMessage(BuildContext context, String message) {
  if (Platform.isAndroid) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        content: Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          margin: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 61),
                child: SizedBox(
                  width: 46,
                  height: 46,
                  child: CircularProgressIndicator(
                    strokeWidth: 6,
                    color: AppColors.iconsPrimary,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  message,
                  style: AppTextStyle.BlinkerRegular(
                    fontSize: 15,
                    color: Color(0xFF3E3E3E),
                  ),
                ),
              ),
              Text(
                "Espere un momento",
                style: AppTextStyle.BlinkerRegular(
                  color: Color(0xFF3E3E3E),
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  } else {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CupertinoAlertDialog(
        content: Column(
          children: [
            SizedBox(height: 16),
            CupertinoActivityIndicator(),
            SizedBox(height: 16),
            Text(
              message,
              style: AppTextStyle.BlinkerRegular(
                fontSize: 15,
                color: Color(0xFF3E3E3E),
              ),
            ),
            Text(
              "Espere un momento",
              style: AppTextStyle.BlinkerRegular(
                color: Color(0xFF3E3E3E),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
