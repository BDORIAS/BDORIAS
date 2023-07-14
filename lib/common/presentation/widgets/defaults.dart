import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_size.dart';
import '../../../core/constants/app_text_input_formatter.dart';
import '../../../core/utils/app_text_style.dart';

class Defaults {
  static Widget defaultTextFormField({
    TextEditingController? controller,
    TextInputType? keyboardType,
    String? labelText,
    String? hinText,
    TextStyle? labelStyle,
    Widget? suffixIcon,
    Widget? prefixIcon,
    ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onSubmit,
    bool obscureText = false,
    int? maxLine = 1,
    int? maxLength,
    List<InputFormatter>? inputFormatter,
    FocusNode? focusNode,
    bool readOnly = false,
    VoidCallback? onTap,
    required BuildContext context,
  }) {
    double radius = AppRadius.r8;
    return SizedBox(
      // height: AppHeight.h44,
      child: TextFormField(
        // cursorColor: Theme.of(context).primaryColor,
        inputFormatters: inputFormatter,
        onTap: onTap,
        focusNode: focusNode,
        readOnly: readOnly,
        maxLength: maxLength,
        maxLines: maxLine,
        controller: controller,
        style: AppTextStyle.labelTextFormField,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(
              vertical: AppHeight.h12, horizontal: AppWidth.w18),
          labelText: labelText,
          labelStyle: labelStyle,
          hintText: hinText,
          hintStyle:const  TextStyle(color: Color(0xFFB0B3BA)),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          prefixIconColor: AppColors.iconsPrimary,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          errorMaxLines: 2,
        ),
        obscureText: obscureText,
        onChanged: onChanged,
        validator: validator,
        onFieldSubmitted: onSubmit,
      ),
    );
  }

  static Widget defaultTextLargeFormField({
    TextEditingController? controller,
    TextInputType? keyboardType,
    String? labelText,
    String? hinText,
    TextStyle? labelStyle,
    Widget? suffixIcon,
    Widget? prefixIcon,
    ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onSubmit,
    bool obscureText = false,
    int? maxLine = 7,
    int? minLine = 5,
    int? maxLength,
    List<InputFormatter>? inputFormatter,
    FocusNode? focusNode,
    bool readOnly = false,
    VoidCallback? onTap,
    required BuildContext context,
  }) {
    double radius = AppRadius.r12;
    return Container(
      height: AppHeight.h100,
      child: TextFormField(
// cursorColor: Theme.of(context).primaryColor,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.top,
        inputFormatters: inputFormatter,
        onTap: onTap,
        focusNode: focusNode,
        readOnly: readOnly,
        maxLength: maxLength,
        minLines: minLine,
        maxLines: maxLine,
        controller: controller,
        style: AppTextStyle.labelTextFormField,
        keyboardType: keyboardType,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(
              vertical: AppHeight.h10, horizontal: AppWidth.w18),
          labelText: labelText,
          labelStyle: labelStyle,
          hintText: hinText,
          hintStyle: TextStyle(color: Color(0xFFB0B3BA)),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          prefixIconColor: AppColors.iconsPrimary,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          errorMaxLines: 2,
          alignLabelWithHint: true,
        ),
        obscureText: obscureText,
        onChanged: onChanged,
        validator: validator,
        onFieldSubmitted: onSubmit,
      ),
    );
  }

  static Widget defaultEditComment({
    TextEditingController? controller,
    TextInputType? keyboardType,
    String? labelText,
    String? hinText,
    TextStyle? labelStyle,
    Widget? suffixIcon,
    Widget? prefixIcon,
    ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onSubmit,
    bool obscureText = false,
    int? maxLine = 1,
    int? maxLength,
    List<InputFormatter>? inputFormatter,
    FocusNode? focusNode,
    bool readOnly = false,
    VoidCallback? onTap,
    required BuildContext context,
  }) {
    double radius = AppRadius.r30;
    return SizedBox(
      // height: AppHeight.h44,
      child: TextFormField(
        // cursorColor: Theme.of(context).primaryColor,
        inputFormatters: inputFormatter,
        onTap: onTap,
        focusNode: focusNode,
        readOnly: readOnly,
        maxLength: maxLength,
        maxLines: maxLine,
        controller: controller,
        style: AppTextStyle.labelTextFormField,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(
              vertical: AppHeight.h12, horizontal: AppWidth.w18),
          labelText: labelText,
          labelStyle: labelStyle,
          hintText: hinText,
          hintStyle: TextStyle(color: Colors.grey),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          prefixIconColor: AppColors.iconsPrimary,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
              color: AppColors.iconsPrimary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
              color: AppColors.iconsPrimary,
            ),
          ),
          errorMaxLines: 2,
        ),
        obscureText: obscureText,
        onChanged: onChanged,
        validator: validator,
        onFieldSubmitted: onSubmit,
      ),
    );
  }

  static Widget defaultTextButton({
    required VoidCallback onPressed,
    required Widget child,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: child,
    );
  }

  static Widget defaultButton({
    required VoidCallback onPressed,
    String? text,
    bool isUpperCase = false,
    required BuildContext context,
  }) {
    return Container(
      height: AppHeight.h44,
      // width: double.infinity,
      decoration: BoxDecoration(
        gradient:
            LinearGradient(colors: [HexColor('#584BDD'), HexColor('#B755FF')]),
        borderRadius: BorderRadius.circular(AppRadius.r86),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(20.0),
        ),
        child: Text(
          "$text",
          style: AppTextStyle.BlinkerSemiBoldWhite(fontSize: AppFontSize.s18),
        ),
      ),
    );
  }

  static Widget defaultButtonBlue({
    required VoidCallback onPressed,
    required String text,
    bool isUpperCase = false,
    required BuildContext context,
  }) {
    return Container(
      height: AppHeight.h35,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.iconsPrimary,
        borderRadius: BorderRadius.circular(AppRadius.r86),
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.r86),
          ),
          backgroundColor: AppColors.transparent,
        ),
        child: Text(
          "$text",
          style: AppTextStyle.BlinkerRegular(
              fontSize: AppFontSize.s15, color: Colors.white),
        ),
      ),
    );
  }

  static Widget defaultButtonWhite({
    required VoidCallback onPressed,
    required String text,
    bool isUpperCase = false,
    required BuildContext context,
  }) {
    return Container(
      height: AppHeight.h35,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: AppColors.iconsPrimary,
        ),
        borderRadius: BorderRadius.circular(AppRadius.r86),
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColors.iconsPrimary),
            borderRadius: BorderRadius.circular(AppRadius.r86),
          ),
          backgroundColor: AppColors.transparent,
        ),
        child: Text(
          "$text",
          style: AppTextStyle.BlinkerRegular(
              fontSize: AppFontSize.s15, color: AppColors.iconsPrimary),
        ),
      ),
    );
  }

  static Widget defaultButtonGreen({
    required VoidCallback onPressed,
    String? text,
    bool isUpperCase = false,
    double height = 40,
    double width = double.infinity,
    double radius = 10,
    required BuildContext context,
  }) {
    return Container(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          )),
          backgroundColor: MaterialStateProperty.all(HexColor('#2FE57C')),
        ),
        child: Text(
          "$text",
          style: TextStyle(
              color: AppColors.grey, fontWeight: FontWeight.w600, fontSize: 22),
        ),
      ),
    );
  }
}
