import 'dart:async';

import 'package:dating_app/core/network/api_client.dart';
import 'package:dating_app/core/network/endpoints.dart';
import 'package:dating_app/features/profile/data/data_source/profile_data_source.dart';
import 'package:dating_app/features/profile/data/models/movie_favorite_list_response_dto.dart';
import 'package:dating_app/features/profile/data/models/user_profile_response_dto.dart';
import 'package:dating_app/injection_container.dart';

class ProfileDataSourceImpl implements ProfileDataSource {
  final _client = locator<ApiClient>();

  @override
  FutureOr<MovieFavoriteListResponseDTO> getFavoriteMovieList() async {
    try {
      final response = await _client.get(Endpoint.getFavoriteList);
      return MovieFavoriteListResponseDTO.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  FutureOr<UserProfileResponseDto> getUserProfile() async {
    try {
      final response = await _client.get(Endpoint.userProfile);
      return UserProfileResponseDto.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
