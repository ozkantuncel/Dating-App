import 'package:dating_app/features/image_upload/data/data_source/upload_image_data_source.dart';
import 'package:dating_app/core/network/api_client.dart';
import 'package:dating_app/core/network/endpoints.dart';
import 'package:dating_app/injection_container.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class UploadImageDataSourceImpl implements UploadImageDataSource {
  final _client = locator<ApiClient>();

  @override
  Future<String?> uploadPhoto({required String filePath}) async {
    try {
      final fileName = filePath.split('/').last;
      final mimeType = lookupMimeType(filePath);

      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          filePath,
          filename: fileName,
          contentType: mimeType != null ? MediaType.parse(mimeType) : null,
        ),
      });

      final response = await _client.postSingle(
        Endpoint.uploadPhoto,
        data: formData,
      );

      if (response.statusCode == 200 && response.data['photoUrl'] != null) {
        return response.data['photoUrl'] as String;
      } else {}
    } catch (e) {
     rethrow;
    }
  }
}
