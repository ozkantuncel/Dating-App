import 'dart:async';

abstract interface class UploadImageRepository {
  FutureOr<String?> uploadPhoto({required String filePath});
}
