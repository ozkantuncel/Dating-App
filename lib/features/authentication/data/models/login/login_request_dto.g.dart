// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestDto _$LoginRequestDtoFromJson(Map<String, dynamic> json) =>
    LoginRequestDto(
      json['email'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestDtoToJson(LoginRequestDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
