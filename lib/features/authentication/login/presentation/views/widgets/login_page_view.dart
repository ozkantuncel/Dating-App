import 'package:dating_app/features/authentication/login/presentation/bloc/login_page_bloc.dart';
import 'package:dating_app/features/authentication/login/presentation/views/widgets/password_textfield.dart';
import 'package:dating_app/resources/assets.gen.dart';
import 'package:dating_app/resources/colors.gen.dart';
import 'package:dating_app/resources/dimens.dart';
import 'package:dating_app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'email_textfield.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginPageView> {
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    final state = context.read<LoginPageBloc>().state;
    if (state.isValid) {
      context.read<LoginPageBloc>().add(const LoginSubmitted());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginPageBloc, LoginPageState>(
      listenWhen: (previous, current) =>
          current.status.isFailure || current.status.isSuccess,
      listener: (context, state) {
        if (state.status.isSuccess) {
          context.go(AppRoutes.home);
        }
      },
      buildWhen: (previous, current) =>
          (previous.email != current.email ||
          previous.password != current.password ||
          previous.status != current.status),
      builder: (context, state) {
        return Padding(
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
                    'Merhabalar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorName.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Tempus varius a vitae interdum id tortor elementum tristique eleifend at.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(height: Dimens.heightSmall * 3),

                  EmailTextField(
                    focusNode: _emailFocusNode,
                    onChanged: (email) => context.read<LoginPageBloc>().add(
                      LoginEmailChanged(email),
                    ),
                    errorText: state.email.displayError?.message,
                    textInputAction: TextInputAction.next,
                    onSubmitted: () => _passwordFocusNode.requestFocus(),
                  ),
                  const SizedBox(height: Dimens.heightSmall),
                  PasswordTextField(
                    focusNode: _passwordFocusNode,
                    onChanged: (password) => context.read<LoginPageBloc>().add(
                      LoginPasswordChanged(password),
                    ),
                    errorText: state.password.displayError?.message,
                    textInputAction: TextInputAction.done,
                    onSubmitted: () => _submit(context),
                  ),

                  const SizedBox(height: Dimens.heightMedium),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Şifremi unuttum',
                        style: TextStyle(
                          color: ColorName.white,
                          decoration: TextDecoration.underline,
                          decorationColor: ColorName.white,
                        ),
                      ),
                    ),
                  ),
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
                        'Giriş Yap',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ColorName.white,
                        ),
                      ),
                    ),

                  const SizedBox(height: 32),

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

                  const SizedBox(height: 32),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Bir hesabın yok mu? ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.go(AppRoutes.register);
                        },
                        child: const Text(
                          'Kayıt Ol!',
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
        );
      },
    );
  }
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
