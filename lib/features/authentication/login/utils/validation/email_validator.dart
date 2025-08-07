import 'package:formz/formz.dart';

enum EmailValidationError {
  empty('E-posta adresi boş olamaz'),
  invalid('Lütfen geçerli bir e-posta adresi giriniz');

  const EmailValidationError(this.message);
  final String message;
}

class EmailValidator extends FormzInput<String, EmailValidationError> {
  const EmailValidator.pure() : super.pure('');

  const EmailValidator.dirty([super.value = '']) : super.dirty();

  static final _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,}$',
  );

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) {
      return EmailValidationError.empty;
    }
    if (!_emailRegExp.hasMatch(value)) {
      return EmailValidationError.invalid;
    }
    return null;
  }
}
