import 'dart:async';

import 'package:dating_app/features/authentication/data/models/login/login_request_dto.dart';
import 'package:dating_app/features/authentication/data/models/login/login_response_dto.dart';
import 'package:dating_app/features/authentication/data/models/register/register_request_dto.dart';
import 'package:dating_app/features/authentication/data/models/register/register_response_dto.dart';

abstract interface class AuthRemoteDataSource {
  FutureOr<RegisterResponseDTO> register({
    required RegisterRequestDto requestDto,
  });

  FutureOr<LoginResponseDTO> login({
    required LoginRequestDto requestDto,
  });
}
