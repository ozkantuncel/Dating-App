import 'package:json_annotation/json_annotation.dart';

part 'movie_favorite_list_response_dto.g.dart';

@JsonSerializable()
class MovieFavoriteListResponseDTO {
  final ResponseInfo response;
  final List<MovieDTO> data;

  MovieFavoriteListResponseDTO({required this.response, required this.data});

  factory MovieFavoriteListResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$MovieFavoriteListResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$MovieFavoriteListResponseDTOToJson(this);
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
class MovieDTO {
  final String id;
  final String Title;
  final String Year;
  final String Rated;
  final String Released;
  final String Runtime;
  final String Genre;
  final String Director;
  final String Writer;
  final String Actors;
  final String Plot;
  final String Language;
  final String Country;
  final String Awards;
  final String Poster;
  final String Metascore;
  final String imdbRating;
  final String imdbVotes;
  final String imdbID;
  final String Type;
  final List<String> Images;
  final bool ComingSoon;
  final bool isFavorite;

  MovieDTO({
    required this.id,
    required this.Title,
    required this.Year,
    required this.Rated,
    required this.Released,
    required this.Runtime,
    required this.Genre,
    required this.Director,
    required this.Writer,
    required this.Actors,
    required this.Plot,
    required this.Language,
    required this.Country,
    required this.Awards,
    required this.Poster,
    required this.Metascore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbID,
    required this.Type,
    this.Images = const [],
    this.ComingSoon = false,
    this.isFavorite = false,
  });

  factory MovieDTO.fromJson(Map<String, dynamic> json) =>
      _$MovieDTOFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDTOToJson(this);
}
