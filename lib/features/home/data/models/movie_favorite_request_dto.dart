import 'package:json_annotation/json_annotation.dart';

part 'movie_favorite_request_dto.g.dart';


@JsonSerializable()
class MovieFavoriteRequestDto {
  String favoriteId;

  MovieFavoriteRequestDto(this.favoriteId);

  factory MovieFavoriteRequestDto.fromJson(Map<String, dynamic> json) =>
      _$MovieFavoriteRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MovieFavoriteRequestDtoToJson(this);
}
