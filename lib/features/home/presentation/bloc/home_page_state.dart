part of 'home_page_bloc.dart';

@immutable
sealed class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object?> get props => [];
}

@immutable
final class HomePageInitial extends HomePageState {
  const HomePageInitial();
}

final class HomePageLoading extends HomePageState {
  const HomePageLoading();
}

@immutable
final class HomePageSuccess extends HomePageState {
  final List<MovieDTO> movie;
  final bool hasMore;
  final int currentPage;
  final int totalPages;

  const HomePageSuccess({
    required this.movie,
    required this.hasMore,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  List<Object> get props => [movie, hasMore, currentPage, totalPages];
}

@immutable
final class HomePageError extends HomePageState {
  final String message;

  const HomePageError(this.message);

  @override
  List<Object> get props => [message];
}
