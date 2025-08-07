import 'package:dating_app/core/authorization/secure_storage_service.dart';
import 'package:dating_app/core/network/api_client.dart';
import 'package:dating_app/core/network/endpoints.dart';
import 'package:dating_app/features/authentication/domain/auth_repository_impl.dart';
import 'package:dating_app/features/authentication/domain/repository/auth_repository.dart';
import 'package:dating_app/features/home/data/data_source/movie_data_source.dart';
import 'package:dating_app/features/home/data/data_source/movie_data_source_impl.dart';
import 'package:dating_app/features/home/domain/movie_repository_impl.dart';
import 'package:dating_app/features/home/domain/repository/movie_repository.dart';
import 'package:dating_app/features/image_upload/data/data_source/upload_image_data_source.dart';
import 'package:dating_app/features/image_upload/data/data_source/upload_image_data_source_impl.dart';
import 'package:dating_app/features/image_upload/domain/repository/upload_image_repository.dart';
import 'package:dating_app/features/image_upload/domain/upload_image_repository_impl.dart';
import 'package:dating_app/features/profile/data/data_source/profile_data_source.dart';
import 'package:dating_app/features/profile/data/data_source/profile_data_source_impl.dart';
import 'package:dating_app/features/profile/domain/profile_repository_impl.dart';
import 'package:dating_app/features/profile/domain/repository/profile_repository.dart';
import 'package:dating_app/features/profile/presentation/bloc/profile_page_bloc.dart';
import 'package:dating_app/router/router.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'core/authorization/auth_manager.dart';
import 'core/authorization/shared_preferences_service.dart';
import 'features/authentication/data/data_source/auth_data_source.dart';
import 'features/authentication/data/data_source/auth_data_source_impl.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  final prefs = await SharedPreferences.getInstance();

  locator
    ..registerLazySingleton<AppRouter>(AppRouter.new)
    ..registerLazySingleton<Dio>(createDioClient)
    ..registerLazySingleton<ApiClient>(ApiClient.new)
    ..registerLazySingleton<Talker>(TalkerFlutter.init)
    ..registerLazySingleton<SharedPreferences>(() => prefs)
    ..registerLazySingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl.new)
    ..registerLazySingleton<SecureStorageService>(SecureStorageService.new)
    ..registerLazySingleton<AuthManager>(AuthManager.new)
    ..registerLazySingleton<AuthRepository>(AuthRepositoryImpl.new)
    ..registerLazySingleton<SharedPreferencesService>(SharedPreferencesService.new)
    ..registerLazySingleton<UploadImageDataSource>(
      UploadImageDataSourceImpl.new,
    )
    ..registerLazySingleton<UploadImageRepository>(
      UploadImageRepositoryImpl.new,
    )
    ..registerLazySingleton<MovieRepository>(MovieRepositoryImpl.new)
    ..registerLazySingleton<MovieDataSource>(MovieDataSourceImpl.new)
    ..registerLazySingleton<ProfileRepository>(ProfileRepositoryImpl.new)
    ..registerLazySingleton<ProfilePageBloc>(ProfilePageBloc.new)
    ..registerLazySingleton<ProfileDataSource>(ProfileDataSourceImpl.new);
}

Dio createDioClient() {
  final dio = Dio(
    BaseOptions(
      baseUrl: Endpoint.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );
  return dio;
}
