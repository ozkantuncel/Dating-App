import 'package:json_annotation/json_annotation.dart';

part 'register_response_dto.g.dart';

@JsonSerializable()
class RegisterResponseDTO {
  final ResponseInfo response;
  final UserData data;

  RegisterResponseDTO({required this.response, required this.data});

  factory RegisterResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseDTOToJson(this);
}

@JsonSerializable()
class ResponseInfo {
  final int code;
  final String message;

  ResponseInfo({required this.code, required this.message});

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
