import 'package:bloc/bloc.dart';
import 'package:dating_app/features/authentication/domain/repository/auth_repository.dart';
import 'package:dating_app/features/authentication/login/utils/validation/email_validator.dart';
import 'package:dating_app/features/authentication/register/utils/validation/password_validator.dart';
import 'package:dating_app/injection_container.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

part 'login_page_event.dart';
part 'login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  LoginPageBloc() : super(const LoginPageState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  final _authRepository = locator<AuthRepository>();

  void _onEmailChanged(LoginEmailChanged event, Emitter<LoginPageState> emit) {
    final email = EmailValidator.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.password]),
        status: FormzSubmissionStatus.initial,
        errorMessage: null,
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginPageState> emit,
  ) {
    final password = PasswordValidator.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.email, password]),
        status: FormzSubmissionStatus.initial,
        errorMessage: null,
      ),
    );
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginPageState> emit,
  ) async {
    if (!state.isValid) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      await _authRepository.login(
        email: state.email.value,
        password: state.password.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
