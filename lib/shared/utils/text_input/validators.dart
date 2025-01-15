import 'package:flutter/material.dart';

import '../strings.dart';

mixin Validators {
  static FormFieldValidator<String> required({String? errMsg}) {
    return (value) {
      if (value == null) {
        return errMsg ?? Strings.requireErr;
      } else if (value.isEmpty) {
        return errMsg ?? Strings.requireErr;
      }
      return null;
    };
  }

  static FormFieldValidator<String> char({String? errMsg}) {
    final RegExp charRegExp = RegExp(r'[0-9!@#$%^&*()_+{}\[\]:;<>,.?~\\]');

    return (value) => value!.isNotEmpty && charRegExp.hasMatch(value)
        ? errMsg ?? Strings.charErr
        : null;
  }

  static FormFieldValidator<String> min(int min, String errMsg) {
    return (value) =>
        (int.parse(value!) >= 0 && int.parse(value) < min) ? errMsg : null;
  }

  static FormFieldValidator<String> max(int max, String errMsg) {
    return (value) =>
        (int.parse(value!) >= 0 && int.parse(value) > max) ? errMsg : null;
  }

  static FormFieldValidator<String> pattern(RegExp pattern, String errMsg) {
    return (value) =>
        (value!.isNotEmpty && !pattern.hasMatch(value)) ? errMsg : null;
  }

  static FormFieldValidator<String> compose(
      List<FormFieldValidator<String>> validators) {
    return (value) {
      for (final validator in validators) {
        if (validator(value) != null) return validator(value);
      }
      return null;
    };
  }
}
