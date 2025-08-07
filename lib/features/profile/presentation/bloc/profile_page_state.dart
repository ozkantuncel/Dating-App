part of 'profile_page_bloc.dart';

sealed class ProfilePageState extends Equatable {
  const ProfilePageState();

  @override
  List<Object?> get props => [];
}

final class ProfilePageInitial extends ProfilePageState {
  const ProfilePageInitial();
}

final class ProfilePageLoading extends ProfilePageState {
  const ProfilePageLoading();
}

final class ProfilePageSuccess extends ProfilePageState {
  final UserData user;
  final List<MovieDTO> favoriteMovies;

  const ProfilePageSuccess({required this.user, this.favoriteMovies = const []});

  @override
  List<Object> get props => [user, favoriteMovies];

  ProfilePageSuccess copyWith({
    UserData? user,
    List<MovieDTO>? favoriteMovies,
  }) {
    return ProfilePageSuccess(
      user: user ?? this.user,
      favoriteMovies: favoriteMovies ?? this.favoriteMovies,
    );
  }
}

final class ProfilePageError extends ProfilePageState {
  final String message;

  const ProfilePageError(this.message);

  @override
  List<Object> get props => [message];
}