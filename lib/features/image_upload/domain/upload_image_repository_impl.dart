import 'dart:async';

import 'package:dating_app/features/image_upload/data/data_source/upload_image_data_source.dart';
import 'package:dating_app/features/image_upload/domain/repository/upload_image_repository.dart';
import 'package:dating_app/injection_container.dart';

class UploadImageRepositoryImpl implements UploadImageRepository {
  final _remoteDataSource = locator<UploadImageDataSource>();

  @override
  FutureOr<String?> uploadPhoto({required String filePath}) async {
    try {
      final photoUrl = await _remoteDataSource.uploadPhoto(filePath: filePath);
      return photoUrl;
    } catch (e) {
      rethrow;
    }
  }
}
