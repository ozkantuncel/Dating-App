part of 'register_page_bloc.dart';

@immutable
sealed class RegisterPageEvent extends Equatable {
  const RegisterPageEvent();

  @override
  List<Object> get props => [];
}

class RegisterNameChanged extends RegisterPageEvent {
  final String name;

  const RegisterNameChanged(this.name);

  @override
  List<Object> get props => [name];
}


final class RegisterEmailChanged extends RegisterPageEvent {
  const RegisterEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

final class RegisterPasswordChanged extends RegisterPageEvent {
  const RegisterPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class RegisterConfirmPasswordChanged extends RegisterPageEvent {
  final String confirmPassword;

  const RegisterConfirmPasswordChanged(this.confirmPassword);

  @override
  List<Object> get props => [confirmPassword];
}

final class RegisterSubmitted extends RegisterPageEvent {
  const RegisterSubmitted();
}
