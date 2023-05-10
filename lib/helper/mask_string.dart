enum MaskPosition { start, end }

String maskString(String value,
    {required int visibleDigits, MaskPosition position = MaskPosition.end}) {
  if (value.length <= visibleDigits) return value;

  int maskLength = value.length - visibleDigits;
  String maskedString = '';
  String masked = List.generate(maskLength, (index) => '*').join();

  if (position == MaskPosition.end) {
    String suffix = value.substring(maskLength);
    maskedString = masked + suffix;
  } else {
    String prefix = value.substring(0, visibleDigits);
    maskedString = prefix + masked;
  }

  return maskedString;
}
