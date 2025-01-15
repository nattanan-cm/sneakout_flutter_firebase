import 'package:flutter/services.dart';

class InputFormatters {
  static FilteringTextInputFormatter number() =>
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'));

  static FilteringTextInputFormatter denyNumber() =>
      FilteringTextInputFormatter.deny(RegExp(r'[0-9]'));
  static FilteringTextInputFormatter denySpecialCharacters() =>
      FilteringTextInputFormatter.deny(
          RegExp(r'''[!@#$%^&*()?"',:;{}|<>\-_=+\[\]\\]'''));

  static FilteringTextInputFormatter ristrictFirstZero() =>
      FilteringTextInputFormatter.deny(
        RegExp(r'^0+'),
      );

  static FilteringTextInputFormatter firstZero() =>
      FilteringTextInputFormatter.deny(
        RegExp(r'^[1-9]+'),
      );

  static FilteringTextInputFormatter deny(regex) =>
      FilteringTextInputFormatter.deny(regex);
  static FilteringTextInputFormatter az09() =>
      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]+'));
  static FilteringTextInputFormatter az() =>
      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]+'));
  static LengthLimitingTextInputFormatter limit(int digit) =>
      LengthLimitingTextInputFormatter(digit);
}
