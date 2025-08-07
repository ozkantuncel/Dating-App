import 'dart:async';

import 'package:dating_app/core/network/api_client.dart';
import 'package:dating_app/core/network/endpoints.dart';
import 'package:dating_app/features/authentication/data/models/login/login_request_dto.dart';
import 'package:dating_app/features/authentication/data/models/login/login_response_dto.dart';
import 'package:dating_app/features/authentication/data/models/register/register_request_dto.dart';
import 'package:dating_app/features/authentication/data/models/register/register_response_dto.dart';
import 'package:dating_app/injection_container.dart';
import 'package:dio/dio.dart';

import 'auth_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final _client = locator<ApiClient>();

  @override
  FutureOr<RegisterResponseDTO> register({
    required RegisterRequestDto requestDto,
  }) async {
    try {
      final response = await _client.post(
        Endpoint.register,
        data: requestDto.toJson(),
      );

      return RegisterResponseDTO.fromJson(response.data);
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  FutureOr<LoginResponseDTO> login({
    required LoginRequestDto requestDto,
  }) async {
    try {
      final response = await _client.post(
        Endpoint.login,
        data: requestDto.toJson(),
      );

      return LoginResponseDTO.fromJson(response.data);
    } on DioException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw e.toString();
    }
  }
}
