import 'package:dating_app/features/home/data/models/movie_response_dto.dart';
import 'package:dating_app/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:dating_app/resources/colors.gen.dart';
import 'package:dating_app/resources/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'movie_card.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    context.read<HomePageBloc>().add(FetchHomePage());
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<HomePageBloc>().add(RefreshHomePage());
        await Future.delayed(const Duration(seconds: 1));
      },
      child: BlocConsumer<HomePageBloc, HomePageState>(
        listener: (context, state) {
          if (state is HomePageError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is HomePageInitial || state is HomePageLoading) {
            return const Center(
              child: SizedBox(
                width: Dimens.iconSizeMedium * 1.5,
                height: Dimens.iconSizeMedium * 1.5,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballSpinFadeLoader,
                  colors: [ColorName.bookmarkYellow],
                ),
              ),
            );
          }
          if (state is HomePageError) {
            return Center(child: Text(state.message));
          }
          if (state is HomePageSuccess) {
            return PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              itemCount: state.movie.length + (state.hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == state.movie.length && state.hasMore) {
                  return VisibilityDetector(
                    key: Key("$index"),
                    onVisibilityChanged: (visibilityInfo) {
                      final visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      if (visiblePercentage > 50) {
                        context.read<HomePageBloc>().add(RefreshHomePage());
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(Dimens.paddingMedium2),
                      child: Center(
                        child: SizedBox(
                          width: Dimens.iconSizeMedium,
                          height: Dimens.iconSizeMedium,
                          child: LoadingIndicator(
                            indicatorType: Indicator.ballSpinFadeLoader,
                            colors: [ColorName.nileBlue],
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return MovieCard(movie: state.movie[index]);
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
