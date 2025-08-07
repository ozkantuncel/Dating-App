import 'dart:async';

import 'package:dating_app/features/authentication/data/models/login/login_response_dto.dart';
import 'package:dating_app/features/authentication/data/models/register/register_response_dto.dart';
import 'package:dating_app/features/home/data/models/movie_favorite_request_dto.dart';
import 'package:dating_app/features/home/data/models/movie_response_dto.dart';

abstract interface class MovieRepository {
  FutureOr<MovieListResponseDTO> getMovieList({
    required int page
  });

  FutureOr<bool> addFavoriteMovie({
    required String favoriteId
  });

}
