import 'package:json_annotation/json_annotation.dart';

part 'register_request_dto.g.dart';

@JsonSerializable()
class RegisterRequestDto {
  String email, name, password;

  RegisterRequestDto(this.email, this.name, this.password);

  factory RegisterRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestDtoToJson(this);
}
