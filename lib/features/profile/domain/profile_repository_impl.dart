import 'dart:async';

import 'package:dating_app/features/profile/data/data_source/profile_data_source.dart';
import 'package:dating_app/features/profile/data/models/movie_favorite_list_response_dto.dart';
import 'package:dating_app/features/profile/data/models/user_profile_response_dto.dart';
import 'package:dating_app/features/profile/domain/repository/profile_repository.dart';
import 'package:dating_app/injection_container.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final _remoteDataSource = locator<ProfileDataSource>();

  @override
  FutureOr<MovieFavoriteListResponseDTO> fetchFavoriteMovieList() {
    try {
      final response = _remoteDataSource.getFavoriteMovieList();
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  FutureOr<UserProfileResponseDto> fetchUserProfile() {
    try {
      final response = _remoteDataSource.getUserProfile();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
