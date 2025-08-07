import 'package:dating_app/features/profile/data/models/movie_favorite_list_response_dto.dart';
import 'package:dating_app/features/profile/domain/repository/profile_repository.dart';
import 'package:dating_app/injection_container.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dating_app/features/profile/data/models/user_profile_response_dto.dart';

part 'profile_page_event.dart';
part 'profile_page_state.dart';

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  final _profileRepository = locator<ProfileRepository>();

  ProfilePageBloc() : super(const ProfilePageInitial()) {
    on<FetchProfile>(_onFetchProfile);
  }

  Future<void> _onFetchProfile(
    FetchProfile event,
    Emitter<ProfilePageState> emit,
  ) async {
    emit(const ProfilePageLoading());
    try {
      final user = await _profileRepository.fetchUserProfile();
      final favoriteMovies = await _profileRepository.fetchFavoriteMovieList();

      emit(
        ProfilePageSuccess(
          user: user.data,
          favoriteMovies: favoriteMovies.data,
        ),
      );
    } catch (e) {
      emit(ProfilePageError('Kullanıcı bilgileri yüklenemedi: $e'));
    }
  }
}
