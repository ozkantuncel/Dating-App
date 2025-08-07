import 'dart:async';

import 'package:dating_app/features/profile/data/models/movie_favorite_list_response_dto.dart';
import 'package:dating_app/features/profile/data/models/user_profile_response_dto.dart';

abstract interface class ProfileRepository {
  FutureOr<MovieFavoriteListResponseDTO> fetchFavoriteMovieList();
  FutureOr<UserProfileResponseDto> fetchUserProfile();
}
