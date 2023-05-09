import 'package:flutter/services.dart';

//This class adds the given prefix to a textfield

//Note that this class only works alongside [FilteringTextInputFormatter.digitsOnly]
//input formatter

//Any number in prefix text is removed

class PrefixAdd extends TextInputFormatter {
  String prefixText;
  PrefixAdd(this.prefixText);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    prefixText = prefixText.replaceAll(RegExp(r'[0-9]'), '');

    int selectionIndex = newValue.text.length - newValue.selection.extentOffset;
    String newString = '$prefixText  ' + newValue.text.toString();
    return TextEditingValue(
      text: newString.toString(),
      selection:
          TextSelection.collapsed(offset: newString.length - selectionIndex),
    );
  }
}
