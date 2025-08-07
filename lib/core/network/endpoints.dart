class Endpoint {
  const Endpoint._();

  static const String baseUrl = "https://caseapi.servicelabs.tech/";

  static const String login = 'user/login';
  static const String register = 'user/register';
  static const String uploadPhoto = 'user/upload_photo';
  static const String userProfile = 'user/profile';
  static const String getFavoriteList = 'movie/favorites';

  static String getMovieListPage(int page) {
    final getMovieListWithPage = 'movie/list?page=$page';
    return getMovieListWithPage;
  }

  static String addFavorite(String favoriteId) {
    final addFavorite = 'movie/favorite/$favoriteId';
    return addFavorite;
  }
}
