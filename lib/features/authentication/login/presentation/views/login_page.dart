import 'package:dating_app/features/authentication/login/presentation/bloc/login_page_bloc.dart';
import 'package:dating_app/features/authentication/login/presentation/views/widgets/login_page_view.dart';
import 'package:dating_app/resources/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.black,
      body: BlocProvider(
        create: (context) => LoginPageBloc(),
        child: LoginPageView(),
      ),
    );
  }
}
