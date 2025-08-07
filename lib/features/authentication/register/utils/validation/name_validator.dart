import 'package:formz/formz.dart';

enum NameValidationError {
  empty('İsim boş olamaz'),
  tooShort('İsim çok kısa olamaz');

  const NameValidationError(this.message);
  final String message;
}

class NameInputValidator extends FormzInput<String, NameValidationError> {
  const NameInputValidator.pure() : super.pure('');
  const NameInputValidator.dirty([super.value = '']) : super.dirty();

  @override
  NameValidationError? validator(String? value) {
    if (value == null || value.isEmpty) return NameValidationError.empty;
    if (value.length < 2) return NameValidationError.tooShort;
    return null;
  }
}