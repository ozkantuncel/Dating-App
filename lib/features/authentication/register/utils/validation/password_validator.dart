import 'package:formz/formz.dart';

enum PasswordValidationError {
  empty('Şifre boş olamaz'),
  tooShort('Şifre en az 8 karakter olmalıdır'),
  noLetter('Şifre en az bir harf içermelidir'),
  noNumber('Şifre en az bir rakam içermelidir'),
  noSpecialChar('Şifre en az bir özel karakter içermelidir');

  const PasswordValidationError(this.message);
  final String message;
}

class PasswordValidator extends FormzInput<String, PasswordValidationError> {
  const PasswordValidator.pure() : super.pure('');

  const PasswordValidator.dirty([super.value = '']) : super.dirty();

  static final _letterRegExp = RegExp(r'[a-zA-Z]');
  static final _numberRegExp = RegExp(r'[0-9]');
  static final _specialCharRegExp = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    }
    if (value.length < 8) {
      return PasswordValidationError.tooShort;
    }
    if (!_letterRegExp.hasMatch(value)) {
      return PasswordValidationError.noLetter;
    }
    if (!_numberRegExp.hasMatch(value)) {
      return PasswordValidationError.noNumber;
    }
    if (!_specialCharRegExp.hasMatch(value)) {
      return PasswordValidationError.noSpecialChar;
    }
    return null;
  }
}
