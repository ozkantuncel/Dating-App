import 'dart:async';

import 'package:dating_app/features/authentication/data/models/login/login_response_dto.dart';
import 'package:dating_app/features/authentication/data/models/register/register_response_dto.dart';

abstract interface class AuthRepository {
  FutureOr<RegisterResponseDTO> register({
    required String name,
    required String email,
    required String password,
  });

  FutureOr<LoginResponseDTO> login({
    required String email,
    required String password,
  });
}
