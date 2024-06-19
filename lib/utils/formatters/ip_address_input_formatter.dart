import 'package:flutter/services.dart';

class IpAddressInputFormatter extends TextInputFormatter {
  final RegExp ipRegExp = RegExp(
    r'^((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]?|[0-9])\.){0,3}(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]?|[0-9])?$',
  );

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String newText = newValue.text;
    if (newText.isEmpty || ipRegExp.hasMatch(newText)) {
      return newValue;
    }
    return oldValue;
  }
}
