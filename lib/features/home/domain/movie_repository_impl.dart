import 'dart:async';
import 'package:dating_app/features/home/data/data_source/movie_data_source.dart';
import 'package:dating_app/features/home/data/models/movie_favorite_request_dto.dart';
import 'package:dating_app/features/home/data/models/movie_response_dto.dart';
import 'package:dating_app/features/home/domain/repository/movie_repository.dart';
import 'package:dating_app/injection_container.dart';

class MovieRepositoryImpl implements MovieRepository {
  final _remoteDataSource = locator<MovieDataSource>();

  @override
  FutureOr<MovieListResponseDTO> getMovieList({required int page}) async {
    try {
      final responseDto = await _remoteDataSource.getMovieList(page: page);
      return responseDto;
    } catch (e) {
      rethrow;
    }
  }

  @override
  FutureOr<bool> addFavoriteMovie({
    required String favoriteId,
  }) async {
    try {
      final favoriteId0 = MovieFavoriteRequestDto(favoriteId);

      final response = await _remoteDataSource.addFavoriteMovie(
        favoriteId: favoriteId0,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
