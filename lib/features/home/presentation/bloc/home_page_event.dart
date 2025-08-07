part of 'home_page_bloc.dart';

sealed class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

final class FetchHomePage extends HomePageEvent {}

final class RefreshHomePage extends HomePageEvent {}

final class ToggleFavorite extends HomePageEvent {
  final String movieId;

  const ToggleFavorite(this.movieId);

  @override
  List<Object> get props => [movieId];
}
