import 'package:json_annotation/json_annotation.dart';

part 'movie_response_dto.g.dart';

@JsonSerializable()
class MovieListResponseDTO {
  final ResponseInfo response;
  final MovieData data;

  MovieListResponseDTO({required this.response, required this.data});

  factory MovieListResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$MovieListResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListResponseDTOToJson(this);
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
class MovieData {
  final List<MovieDTO> movies;
  final PaginationDTO pagination;

  MovieData({required this.movies, required this.pagination});

  factory MovieData.fromJson(Map<String, dynamic> json) =>
      _$MovieDataFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDataToJson(this);
}

@JsonSerializable()
class PaginationDTO {
  final int totalCount;
  final int perPage;
  final int maxPage;
  final int currentPage;

  PaginationDTO({
    required this.totalCount,
    required this.perPage,
    required this.maxPage,
    required this.currentPage,
  });

  factory PaginationDTO.fromJson(Map<String, dynamic> json) =>
      _$PaginationDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationDTOToJson(this);
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

  MovieDTO copyWith({
    String? id,
    String? Title,
    String? Year,
    String? Rated,
    String? Released,
    String? Runtime,
    String? Genre,
    String? Director,
    String? Writer,
    String? Actors,
    String? Plot,
    String? Language,
    String? Country,
    String? Awards,
    String? Poster,
    String? Metascore,
    String? imdbRating,
    String? imdbVotes,
    String? imdbID,
    String? Type,
    List<String>? Images,
    bool? ComingSoon,
    bool? isFavorite,
  }) {
    return MovieDTO(
      id: id ?? this.id,
      Title: Title ?? this.Title,
      Year: Year ?? this.Year,
      Rated: Rated ?? this.Rated,
      Released: Released ?? this.Released,
      Runtime: Runtime ?? this.Runtime,
      Genre: Genre ?? this.Genre,
      Director: Director ?? this.Director,
      Writer: Writer ?? this.Writer,
      Actors: Actors ?? this.Actors,
      Plot: Plot ?? this.Plot,
      Language: Language ?? this.Language,
      Country: Country ?? this.Country,
      Awards: Awards ?? this.Awards,
      Poster: Poster ?? this.Poster,
      Metascore: Metascore ?? this.Metascore,
      imdbRating: imdbRating ?? this.imdbRating,
      imdbVotes: imdbVotes ?? this.imdbVotes,
      imdbID: imdbID ?? this.imdbID,
      Type: Type ?? this.Type,
      Images: Images ?? this.Images,
      ComingSoon: ComingSoon ?? this.ComingSoon,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  List<Object?> get props => [
    id,
    Title,
    Year,
    Rated,
    Released,
    Runtime,
    Genre,
    Director,
    Writer,
    Actors,
    Plot,
    Language,
    Country,
    Awards,
    Poster,
    Metascore,
    imdbRating,
    imdbVotes,
    imdbID,
    Type,
    Images,
    ComingSoon,
    isFavorite,
  ];
}
