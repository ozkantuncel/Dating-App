// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestDto _$RegisterRequestDtoFromJson(Map<String, dynamic> json) =>
    RegisterRequestDto(
      json['email'] as String,
      json['name'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$RegisterRequestDtoToJson(RegisterRequestDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'password': instance.password,
    };
