import 'package:dating_app/features/authentication/register/presentation/bloc/register_page_bloc.dart';
import 'package:dating_app/features/authentication/register/presentation/views/widgets/register_page_view.dart';
import 'package:dating_app/resources/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.black,
      body: BlocProvider(
        create: (context) => RegisterPageBloc(),
        child: RegisterView(),
      ),
    );
  }
}
