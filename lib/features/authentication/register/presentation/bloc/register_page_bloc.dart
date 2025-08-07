import 'package:bloc/bloc.dart';
import 'package:dating_app/features/authentication/domain/repository/auth_repository.dart';
import 'package:dating_app/features/authentication/login/utils/validation/email_validator.dart';
import 'package:dating_app/features/authentication/register/utils/validation/name_validator.dart';
import 'package:dating_app/features/authentication/register/utils/validation/password_confirm_validator.dart';
import 'package:dating_app/features/authentication/register/utils/validation/password_validator.dart';
import 'package:dating_app/injection_container.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

part 'register_page_event.dart';
part 'register_page_state.dart';

class RegisterPageBloc extends Bloc<RegisterPageEvent, RegisterPageState> {
  RegisterPageBloc():super(const RegisterPageState()) {
    on<RegisterNameChanged>(_onNameChanged);
    on<RegisterEmailChanged>(_onEmailChanged);
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<RegisterSubmitted>(_onSubmitted);
  }
  final _authRepository = locator<AuthRepository>();


  void _onNameChanged(RegisterNameChanged event, Emitter<RegisterPageState> emit) {
    final name = NameInputValidator.dirty(event.name);
    emit(
      state.copyWith(
        name: name,
        isValid: Formz.validate([name, state.email, state.password, state.confirmPassword]),
        status: FormzSubmissionStatus.initial,
        clearErrorMessage: true,
      ),
    );
  }

  void _onEmailChanged(RegisterEmailChanged event, Emitter<RegisterPageState> emit) {
    final email = EmailValidator.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([state.name, email, state.password, state.confirmPassword]),
        status: FormzSubmissionStatus.initial,
        clearErrorMessage: true,
      ),
    );
  }

  void _onPasswordChanged(RegisterPasswordChanged event, Emitter<RegisterPageState> emit) {
    final password = PasswordValidator.dirty(event.password);
    final confirmPassword = ConfirmPasswordValidator.dirty(
      password: password.value,
      value: state.confirmPassword.value,
    );
    emit(
      state.copyWith(
        password: password,
        confirmPassword: confirmPassword,
        isValid: Formz.validate([state.name, state.email, password, confirmPassword]),
        status: FormzSubmissionStatus.initial,
        clearErrorMessage: true,
      ),
    );
  }

  void _onConfirmPasswordChanged(RegisterConfirmPasswordChanged event, Emitter<RegisterPageState> emit) {
    final confirmPassword = ConfirmPasswordValidator.dirty(
      password: state.password.value,
      value: event.confirmPassword,
    );
    emit(
      state.copyWith(
        confirmPassword: confirmPassword,
        isValid: Formz.validate([state.name, state.email, state.password, confirmPassword]),
        status: FormzSubmissionStatus.initial,
        clearErrorMessage: true,
      ),
    );
  }

  Future<void> _onSubmitted(RegisterSubmitted event, Emitter<RegisterPageState> emit) async {
    final name = NameInputValidator.dirty(state.name.value);
    final email = EmailValidator.dirty(state.email.value);
    final password = PasswordValidator.dirty(state.password.value);
    final confirmPassword = ConfirmPasswordValidator.dirty(
        password: password.value, value: state.confirmPassword.value);

    emit(state.copyWith(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      isValid: Formz.validate([name, email, password, confirmPassword]),
    ));

    if (!state.isValid) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      await _authRepository.register(
        name: state.name.value,
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