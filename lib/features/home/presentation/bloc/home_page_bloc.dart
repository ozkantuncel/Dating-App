import 'package:dating_app/features/home/data/models/movie_response_dto.dart';
import 'package:dating_app/features/home/domain/repository/movie_repository.dart';
import 'package:dating_app/injection_container.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_page_state.dart';
part 'home_page_event.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final _repositoryMovie = locator<MovieRepository>();

  HomePageBloc() : super(const HomePageInitial()) {
    on<FetchHomePage>(_onFetchHomePage);
    on<RefreshHomePage>(_onRefreshHomePage);
    on<ToggleFavorite>(_onToggleFavorite);
  }

  Future<void> _onFetchHomePage(
    FetchHomePage event,
    Emitter<HomePageState> emit,
  ) async {
    if (state is! HomePageSuccess) emit(const HomePageLoading());
    try {
      final response = await _repositoryMovie.getMovieList(page: 1);

      if (response.data.movies.isNotEmpty) {
        final currentPage = response.data.pagination.currentPage;
        final totalPages = response.data.pagination.maxPage;
        final hasMore = currentPage < totalPages;

        emit(
          HomePageSuccess(
            movie: response.data.movies,
            hasMore: hasMore,
            currentPage: currentPage,
            totalPages: totalPages,
          ),
        );
      } else {
        emit(HomePageError("Boş veri"));
      }
    } catch (e) {
      emit(HomePageError(e.toString()));
    }
  }

  Future<void> _onRefreshHomePage(
    RefreshHomePage event,
    Emitter<HomePageState> emit,
  ) async {
    final currentState = (state as HomePageSuccess);

    final currentPage = currentState.currentPage;
    final hasMore = (currentPage + 1) <= currentState.totalPages;
    if (hasMore) {
      try {
        final response = await _repositoryMovie.getMovieList(
          page: (currentPage + 1),
        );

        if (response.data.movies.isNotEmpty) {
          final currentPage = response.data.pagination.currentPage;
          final hasMore = currentPage < currentState.totalPages;

          final updatedMovies = [
            ...currentState.movie,
            ...response.data.movies,
          ];

          emit(
            HomePageSuccess(
              movie: updatedMovies,
              hasMore: hasMore,
              currentPage: currentPage,
              totalPages: currentState.totalPages,
            ),
          );
        } else {
          emit(HomePageError("Boş veri"));
        }
      } catch (e) {
        emit(HomePageError(e.toString()));
      }
    }
  }

  Future<void> _onToggleFavorite(
    ToggleFavorite event,
    Emitter<HomePageState> emit,
  ) async {
    final currentState = (state as HomePageSuccess);

    try {
      final response = await _repositoryMovie.addFavoriteMovie(
        favoriteId: event.movieId,
      );
      if (response) {
        final updatedHomePage = currentState.movie.map((movie) {
          if (movie.id == event.movieId) {
            return movie.copyWith(isFavorite: true);
          }
          return movie;
        }).toList();

        emit(
          HomePageSuccess(
            movie: updatedHomePage,
            hasMore: currentState.hasMore,
            currentPage: currentState.currentPage,
            totalPages: currentState.totalPages,
          ),
        );
      } else {
        emit(HomePageError("Eklerken bir hata oldu"));
      }
    } catch (e) {
      emit(HomePageError(e.toString()));
    }
  }
}
