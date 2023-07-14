import 'package:flutter/services.dart';

class InputFormatter extends TextInputFormatter {
  final String sample;
  final String separetor;

  InputFormatter({required this.sample, required this.separetor});
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 0) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > sample.length) return oldValue;
        if (newValue.text.length < sample.length &&
            sample[newValue.text.length - 1] == separetor) {
          return TextEditingValue(
              text:
                  '${oldValue.text}$separetor${newValue.text.substring(newValue.text.length - 1)}',
              selection:
                  TextSelection.collapsed(offset: newValue.selection.end + 1));
        }
      }
    }
    //throw UnimplementedError();
    return newValue;
  }
}