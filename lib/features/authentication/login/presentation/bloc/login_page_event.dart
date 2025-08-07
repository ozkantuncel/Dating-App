part of 'login_page_bloc.dart';

@immutable
sealed class LoginPageEvent extends Equatable {
  const LoginPageEvent();

  @override
  List<Object> get props => [];
}

final class LoginEmailChanged extends LoginPageEvent {
  const LoginEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

final class LoginPasswordChanged extends LoginPageEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

final class LoginSubmitted extends LoginPageEvent {
  const LoginSubmitted();
}
