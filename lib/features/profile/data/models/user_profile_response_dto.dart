import 'package:json_annotation/json_annotation.dart';

part 'user_profile_response_dto.g.dart';

@JsonSerializable()
class UserProfileResponseDto {
  final ResponseInfo response;
  final UserData data;

  UserProfileResponseDto({required this.response, required this.data});

  factory UserProfileResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileResponseDtoToJson(this);
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

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
