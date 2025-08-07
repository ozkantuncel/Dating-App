import 'package:dating_app/features/authentication/login/presentation/views/widgets/email_textfield.dart';
import 'package:dating_app/features/authentication/login/presentation/views/widgets/password_textfield.dart';
import 'package:dating_app/features/authentication/register/presentation/bloc/register_page_bloc.dart';
import 'package:dating_app/features/authentication/register/presentation/views/widgets/confirm_password_textfield.dart';
import 'package:dating_app/resources/assets.gen.dart';
import 'package:dating_app/resources/colors.gen.dart';
import 'package:dating_app/resources/dimens.dart';
import 'package:dating_app/router/app_routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'name_textfield.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late FocusNode _nameFocusNode;
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;
  late FocusNode _confirmPasswordFocusNode;

  @override
  void initState() {
    super.initState();
    _nameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    final state = context.read<RegisterPageBloc>().state;
    if (state.isValid) {
      context.read<RegisterPageBloc>().add(const RegisterSubmitted());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterPageBloc, RegisterPageState>(
      listenWhen: (previous, current) =>
          current.status.isFailure || current.status.isSuccess,
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage ?? 'Kayıt başarısız')),
          );
        }
        if (state.status.isSuccess) {
          context.go(AppRoutes.home);
        }
        if (state.status.isFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        }
      },
      buildWhen: (previous, current) =>
          (previous.name != current.name ||
          previous.email != current.email ||
          previous.password != current.password ||
          previous.confirmPassword != current.confirmPassword ||
          previous.status != current.status),
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimens.verticalPadding,
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Hoşgeldiniz',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorName.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    const Text(
                      'Tempus varius a vitae interdum id tortor elementum tristique eleifend at.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(height: Dimens.heightSmall * 2),
                    NameTextField(
                      focusNode: _nameFocusNode,
                      onChanged: (name) => context.read<RegisterPageBloc>().add(
                        RegisterNameChanged(name),
                      ),
                      errorText: state.name.displayError?.message,
                      textInputAction: TextInputAction.next,
                      onSubmitted: () => _emailFocusNode.requestFocus(),
                    ),
                    const SizedBox(height: Dimens.heightSmall / 2),
                    EmailTextField(
                      focusNode: _emailFocusNode,
                      onChanged: (email) => context
                          .read<RegisterPageBloc>()
                          .add(RegisterEmailChanged(email)),
                      errorText: state.email.displayError?.message,
                      textInputAction: TextInputAction.next,
                      onSubmitted: () => _passwordFocusNode.requestFocus(),
                    ),
                    const SizedBox(height: Dimens.heightSmall),
                    PasswordTextField(
                      focusNode: _passwordFocusNode,
                      onChanged: (password) => context
                          .read<RegisterPageBloc>()
                          .add(RegisterPasswordChanged(password)),
                      errorText: state.password.displayError?.message,
                      textInputAction: TextInputAction.next,
                      onSubmitted: () =>
                          _confirmPasswordFocusNode.requestFocus(),
                    ),
                    const SizedBox(height: Dimens.heightSmall / 2),
                    ConfirmPasswordTextfield(
                      focusNode: _confirmPasswordFocusNode,
                      onChanged: (confirmPassword) => context
                          .read<RegisterPageBloc>()
                          .add(RegisterConfirmPasswordChanged(confirmPassword)),
                      errorText: state.confirmPassword.displayError?.message,
                      textInputAction: TextInputAction.done,
                      onSubmitted: () => _submit(context),
                    ),
                    const SizedBox(height: Dimens.heightSmall),
                    _buildTermsAndConditions(),
                    const SizedBox(height: Dimens.heightMedium),
                    if (state.status.isInProgress)
                      Center(
                        child: SizedBox(
                          width: Dimens.iconSizeMedium * 1.5,
                          height: Dimens.iconSizeMedium * 1.5,
                          child: LoadingIndicator(
                            indicatorType: Indicator.ballSpinFadeLoader,
                            colors: [ColorName.white],
                          ),
                        ),
                      )
                    else
                      ElevatedButton(
                        onPressed: () {
                          if (state.isValid) {
                            _submit(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE50914),
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Şimdi Kaydol',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorName.white,
                          ),
                        ),
                      ),
                    const SizedBox(height: Dimens.heightMedium),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialButton(assetPath: Assets.icon.google),
                        const SizedBox(width: 16),
                        _buildSocialButton(assetPath: Assets.icon.apple),
                        const SizedBox(width: 16),
                        _buildSocialButton(assetPath: Assets.icon.meta),
                      ],
                    ),
                    const SizedBox(height: Dimens.heightMedium),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Zaten bir hesabın var mı? ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.go(AppRoutes.login);
                          },
                          child: const Text(
                            'Giriş Yap!',
                            style: TextStyle(
                              color: ColorName.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTermsAndConditions() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.grey, fontSize: 14),
              children: [
                const TextSpan(text: 'Kullanıcı sözleşmesini '),
                TextSpan(
                  text: 'okudum ve kabul ediyorum.',
                  style: const TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
                const TextSpan(
                  text: ' Bu sözleşmeyi okuyarak devam ediniz lütfen.',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton({required String assetPath}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: SvgPicture.asset(assetPath),
    );
  }
}
