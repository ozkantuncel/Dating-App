import 'dart:async';

import 'package:dating_app/core/authorization/secure_storage_service.dart';
import 'package:dating_app/features/authentication/data/data_source/auth_data_source.dart';
import 'package:dating_app/features/authentication/data/models/login/login_request_dto.dart';
import 'package:dating_app/features/authentication/data/models/login/login_response_dto.dart';
import 'package:dating_app/features/authentication/data/models/register/register_request_dto.dart';
import 'package:dating_app/features/authentication/data/models/register/register_response_dto.dart';
import 'package:dating_app/features/authentication/domain/repository/auth_repository.dart';
import 'package:dating_app/injection_container.dart';

class AuthRepositoryImpl implements AuthRepository {
  final _remoteDataSource = locator<AuthRemoteDataSource>();
  final _storageService = locator<SecureStorageService>();

  @override
  FutureOr<RegisterResponseDTO> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final requestDto = RegisterRequestDto(email, name, password);

    final responseDto = await _remoteDataSource.register(
      requestDto: requestDto,
    );

    await _storageService.saveToken(responseDto.data.token);

    return responseDto;
  }

  @override
  FutureOr<LoginResponseDTO> login({
    required String email,
    required String password,
  }) async{
    final requestDto = LoginRequestDto(email, password);

    final responseDto = await _remoteDataSource.login(
      requestDto: requestDto,
    );

    await _storageService.saveToken(responseDto.data.token);

    return responseDto;
  }
}
