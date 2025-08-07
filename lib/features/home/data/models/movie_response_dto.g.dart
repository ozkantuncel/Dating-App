// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListResponseDTO _$MovieListResponseDTOFromJson(
        Map<String, dynamic> json) =>
    MovieListResponseDTO(
      response: ResponseInfo.fromJson(json['response'] as Map<String, dynamic>),
      data: MovieData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieListResponseDTOToJson(
        MovieListResponseDTO instance) =>
    <String, dynamic>{
      'response': instance.response,
      'data': instance.data,
    };

ResponseInfo _$ResponseInfoFromJson(Map<String, dynamic> json) => ResponseInfo(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$ResponseInfoToJson(ResponseInfo instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };

MovieData _$MovieDataFromJson(Map<String, dynamic> json) => MovieData(
      movies: (json['movies'] as List<dynamic>)
          .map((e) => MovieDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          PaginationDTO.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieDataToJson(MovieData instance) => <String, dynamic>{
      'movies': instance.movies,
      'pagination': instance.pagination,
    };

PaginationDTO _$PaginationDTOFromJson(Map<String, dynamic> json) =>
    PaginationDTO(
      totalCount: (json['totalCount'] as num).toInt(),
      perPage: (json['perPage'] as num).toInt(),
      maxPage: (json['maxPage'] as num).toInt(),
      currentPage: (json['currentPage'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationDTOToJson(PaginationDTO instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'perPage': instance.perPage,
      'maxPage': instance.maxPage,
      'currentPage': instance.currentPage,
    };

MovieDTO _$MovieDTOFromJson(Map<String, dynamic> json) => MovieDTO(
      id: json['id'] as String,
      Title: json['Title'] as String,
      Year: json['Year'] as String,
      Rated: json['Rated'] as String,
      Released: json['Released'] as String,
      Runtime: json['Runtime'] as String,
      Genre: json['Genre'] as String,
      Director: json['Director'] as String,
      Writer: json['Writer'] as String,
      Actors: json['Actors'] as String,
      Plot: json['Plot'] as String,
      Language: json['Language'] as String,
      Country: json['Country'] as String,
      Awards: json['Awards'] as String,
      Poster: json['Poster'] as String,
      Metascore: json['Metascore'] as String,
      imdbRating: json['imdbRating'] as String,
      imdbVotes: json['imdbVotes'] as String,
      imdbID: json['imdbID'] as String,
      Type: json['Type'] as String,
      Images: (json['Images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      ComingSoon: json['ComingSoon'] as bool? ?? false,
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$MovieDTOToJson(MovieDTO instance) => <String, dynamic>{
      'id': instance.id,
      'Title': instance.Title,
      'Year': instance.Year,
      'Rated': instance.Rated,
      'Released': instance.Released,
      'Runtime': instance.Runtime,
      'Genre': instance.Genre,
      'Director': instance.Director,
      'Writer': instance.Writer,
      'Actors': instance.Actors,
      'Plot': instance.Plot,
      'Language': instance.Language,
      'Country': instance.Country,
      'Awards': instance.Awards,
      'Poster': instance.Poster,
      'Metascore': instance.Metascore,
      'imdbRating': instance.imdbRating,
      'imdbVotes': instance.imdbVotes,
      'imdbID': instance.imdbID,
      'Type': instance.Type,
      'Images': instance.Images,
      'ComingSoon': instance.ComingSoon,
      'isFavorite': instance.isFavorite,
    };
