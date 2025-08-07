import 'package:json_annotation/json_annotation.dart';

part 'login_response_dto.g.dart';


@JsonSerializable()
class LoginResponseDTO {
  final ResponseInfo response;
  final UserData data;

  LoginResponseDTO({
    required this.response,
    required this.data,
  });

  factory LoginResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseDTOToJson(this);
}

@JsonSerializable()
class ResponseInfo {
  final int code;
  final String message;

  ResponseInfo({
    required this.code,
    required this.message,
  });

  factory ResponseInfo.fromJson(Map<String, dynamic> json) =>
      _$ResponseInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseInfoToJson(this);
}

@JsonSerializable()
class UserData {
  final String id;
  final String name;
  final String email;
  final String photoUrl;
  final String token;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}