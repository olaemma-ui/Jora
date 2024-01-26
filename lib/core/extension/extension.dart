import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

extension StringEnxtension on String {
  /// This is a getter that converts an hext color code to [Color]
  Color get hex => Color(int.parse(replaceAll('#', '0xFF')));

  /// This extension returns an object with
  /// whose each field value are boolean
  /// to determine if the condition for that is met
  Map<String, bool> _password() {
    bool upper = RegExp(r'[A-Z]').hasMatch(this);
    bool lower = RegExp(r'[a-z]').hasMatch(this);
    bool number = RegExp(r'[0-9]').hasMatch(this);
    bool symbol = RegExp(r'[(!@#$%^&*)]').hasMatch(this);
    bool length = this.length >= 8;
    return {
      'upper': upper,
      'lower': lower,
      'number': number,
      'symbol': symbol,
      'length': length
    };
  }

  Map<String, bool> get passwordValidate => _password();

  /// This method validates the data passed
  /// [key] this is an identifier to check for when validating
  /// e.g. {
  ///   'username': 'the value'
  /// }
  ///
  /// username is the key
  ///
  /// [errors] this are the fields where the error message will be mapped to
  /// [isRequired] determines if the field is required during validation
  validate({
    required String key,
    bool? isRequired = false,
  }) {
    String? errors;

    if (key.toLowerCase().contains('name')) {
      errors = (isNotEmpty && isRequired!)
          ? (isAlphabetOnly)
              ? null
              : 'Invalid name'
          : (isEmpty && isRequired!)
              ? 'This field is required'
              : null;
      // valid = isNotEmpty ? isAlphabetOnly : false;
    }

    if (key == 'email') {
      errors = (isNotEmpty && isRequired!)
          ? (isEmail)
              ? null
              : 'Invalid email address'
          : (isEmpty && isRequired!)
              ? 'This field is required'
              : null;
      // valid = isNotEmpty ? isEmail : false;
    }

    if (key == 'phone') {
      errors = (isNotEmpty && isRequired!)
          ? (isPhoneNumber)
              ? null
              : 'Invalid phone number'
          : (isEmpty && isRequired!)
              ? 'This field is required'
              : null;
      // valid = isNotEmpty ? isPhoneNumber : false;
    }

    if (key.toLowerCase().contains('password')) {
      errors = (isNotEmpty) ? null : 'This field is required';
      // valid = isNotEmpty;
    }

    return errors;
  }
}
