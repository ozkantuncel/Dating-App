import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/features/home/data/models/movie_response_dto.dart';
import 'package:dating_app/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieCard extends StatelessWidget {
  final MovieDTO movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final isFavorite = movie.isFavorite;
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: movie.Poster,
            fit: BoxFit.fill,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => _buildPlaceholder(),
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.4),
                  Colors.black.withOpacity(0.9),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.5, 0.8, 1.0],
              ),
            ),
          ),
          Positioned(
            bottom: 110,
            right: 20,
            child: GestureDetector(
              onTap: () {
                if (!isFavorite) {
                  context.read<HomePageBloc>().add(ToggleFavorite(movie.id));
                }
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white.withOpacity(0.15),
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.white : Colors.white,
                  size: 32,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 50,
            left: 20,
            right: 80,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.red,
                  child: Text(
                    'N',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        movie.Title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(blurRadius: 4, color: Colors.black54),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          children: [
                            TextSpan(text: movie.Plot),
                            const TextSpan(
                              text: ' Daha Fazlası',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder() {
    return CachedNetworkImage(
      imageUrl: movie.Images[0],
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
