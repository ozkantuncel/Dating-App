import 'package:formz/formz.dart';

enum ConfirmPasswordError {
  empty('Şifre onayı boş olamaz'),
  notMatch('Şifreler eşleşmiyor');

  const ConfirmPasswordError(this.message);
  final String message;
}

class ConfirmPasswordValidator
    extends FormzInput<String, ConfirmPasswordError> {
  final String password;

  const ConfirmPasswordValidator.pure({this.password = ''}) : super.pure('');
  const ConfirmPasswordValidator.dirty({
    required this.password,
    String value = '',
  }) : super.dirty(value);

  @override
  ConfirmPasswordError? validator(String value) {
    if (value.isEmpty) {
      return ConfirmPasswordError.empty;
    }
    if (value != password) {
      return ConfirmPasswordError.notMatch;
    }
    return null;
  }
}
