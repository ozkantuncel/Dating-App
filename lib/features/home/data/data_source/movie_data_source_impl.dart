import 'dart:async';

import 'package:dating_app/core/network/api_client.dart';
import 'package:dating_app/core/network/endpoints.dart';
import 'package:dating_app/features/home/data/data_source/movie_data_source.dart';
import 'package:dating_app/features/home/data/models/movie_favorite_request_dto.dart';
import 'package:dating_app/features/home/data/models/movie_response_dto.dart';
import 'package:dating_app/injection_container.dart';
import 'package:dio/dio.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final _client = locator<ApiClient>();

  @override
  FutureOr<MovieListResponseDTO> getMovieList({required int page}) async {
    try {
      final response = await _client.get(Endpoint.getMovieListPage(page));

      return MovieListResponseDTO.fromJson(response.data);
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  FutureOr<bool> addFavoriteMovie({
    required MovieFavoriteRequestDto favoriteId,
  }) async {
    try {
      final response = await _client.post(
        Endpoint.addFavorite(favoriteId.favoriteId),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
