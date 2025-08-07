import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:dating_app/features/profile/presentation/bloc/profile_page_bloc.dart';
import 'package:dating_app/resources/colors.gen.dart';
import 'package:dating_app/resources/dimens.dart';
import 'package:dating_app/features/profile/data/models/movie_favorite_list_response_dto.dart';

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({super.key});

  @override
  State<ProfilePageView> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePageView> {
  @override
  void initState() {
    super.initState();
    context.read<ProfilePageBloc>().add(FetchProfile());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfilePageBloc, ProfilePageState>(
      listener: (context, state) {
        if (state is ProfilePageError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      builder: (context, state) {
        if (state is ProfilePageInitial || state is ProfilePageLoading) {
          return const Center(
            child: SizedBox(
              width: Dimens.iconSizeMedium * 1.5,
              height: Dimens.iconSizeMedium * 1.5,
              child: LoadingIndicator(
                indicatorType: Indicator.ballSpinFadeLoader,
                colors: [ColorName.tealishBlue],
              ),
            ),
          );
        }
        if (state is ProfilePageError) {
          return Center(child: Text(state.message));
        }
        if (state is ProfilePageSuccess) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: _buildUserInfoSection(context, state)),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
                  child: Text(
                    'Beğendiğim Filmler',
                    style: TextStyle(
                      color: ColorName.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              _buildFavoriteMoviesGrid(state.favoriteMovies),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildUserInfoSection(BuildContext context, ProfilePageSuccess state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: Colors.grey.shade800,
                backgroundImage: (state.user.photoUrl.isNotEmpty)
                    ? CachedNetworkImageProvider(state.user.photoUrl)
                    : null,
                child: (state.user.photoUrl.isEmpty)
                    ? const Icon(Icons.person, size: 32, color: Colors.grey)
                    : null,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.user.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'ID: ${state.user.id.substring(0, 4)}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              context.push(AppRoutes.uploadPhoto);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Fotoğraf Ekle',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: ColorName.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteMoviesGrid(List<MovieDTO> movies) {
    if (movies.isEmpty) {
      return const SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(32.0),
            child: Text(
              'Henüz beğendiğiniz film yok.',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.65,
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          final movie = movies[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: movie.Poster,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    placeholder: (c, u) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        _buildPlaceholder(movie.Images[0]),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                movie.Title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                movie.Director ?? 'Unknown Director',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          );
        }, childCount: movies.length),
      ),
    );
  }

  Widget _buildPlaceholder(String image) {
    return CachedNetworkImage(
      imageUrl: image,
      fit: BoxFit.fill,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => _buildPlaceholderImagePoser(),
    );
  }

  Widget _buildPlaceholderImagePoser() {
    return Container(
      color: Colors.grey.shade900,
      child: const Center(
        child: Icon(
          Icons.movie_creation_outlined,
          color: Colors.grey,
          size: 100,
        ),
      ),
    );
  }
}
