part of 'register_page_bloc.dart';

@immutable
class RegisterPageState extends Equatable {
  final FormzSubmissionStatus status;
  final NameInputValidator name;
  final EmailValidator email;
  final PasswordValidator password;
  final ConfirmPasswordValidator confirmPassword;
  final bool isValid;
  final String? errorMessage;

  const RegisterPageState({
    this.status = FormzSubmissionStatus.initial,
    this.name = const NameInputValidator.pure(),
    this.email = const EmailValidator.pure(),
    this.password = const PasswordValidator.pure(),
    this.confirmPassword = const ConfirmPasswordValidator.pure(),
    this.isValid = false,
    this.errorMessage,
  });

  RegisterPageState copyWith({
    FormzSubmissionStatus? status,
    NameInputValidator? name,
    EmailValidator? email,
    PasswordValidator? password,
    ConfirmPasswordValidator? confirmPassword,
    bool? isValid,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return RegisterPageState(
      status: status ?? this.status,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isValid: isValid ?? this.isValid,
      errorMessage: clearErrorMessage ? null : errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    name,
    email,
    password,
    confirmPassword,
    isValid,
    errorMessage,
  ];
}