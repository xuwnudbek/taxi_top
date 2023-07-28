import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PriceInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove all non-digit characters from the input value
    String cleanedText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Format the cleaned text using NumberFormat to add commas for thousands
    String formattedValue = NumberFormat('#,###').format(int.parse(cleanedText));

    // Return the updated TextEditingValue
    return newValue.copyWith(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }
}
