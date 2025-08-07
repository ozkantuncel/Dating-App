part of 'login_page_bloc.dart';

@immutable
class LoginPageState extends Equatable {
  final FormzSubmissionStatus status;
  final EmailValidator email;
  final PasswordValidator password;
  final bool isValid;
  final String? errorMessage;

  const LoginPageState({
    this.status = FormzSubmissionStatus.initial,
    this.email = const EmailValidator.pure(),
    this.password = const PasswordValidator.pure(),
    this.isValid = false,
    this.errorMessage,
  });

  LoginPageState copyWith({
    FormzSubmissionStatus? status,
    EmailValidator? email,
    PasswordValidator? password,
    bool? isValid,
    String? errorMessage,
  }) {
    return LoginPageState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, email, password, isValid, errorMessage];
}