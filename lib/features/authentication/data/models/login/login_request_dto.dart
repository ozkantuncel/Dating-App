

import 'package:json_annotation/json_annotation.dart';

part 'login_request_dto.g.dart';


@JsonSerializable()
class LoginRequestDto {
  String email, password;

  LoginRequestDto(this.email, this.password);

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestDtoToJson(this);
}