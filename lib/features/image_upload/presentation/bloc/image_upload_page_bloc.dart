import 'package:bloc/bloc.dart';
import 'package:dating_app/features/image_upload/domain/repository/upload_image_repository.dart';
import 'package:dating_app/injection_container.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'image_upload_page_state.dart';
part 'image_upload_page_event.dart';

class UploadPhotoPageBloc
    extends Bloc<UploadPhotoPageEvent, UploadPhotoPageState> {
  UploadPhotoPageBloc() : super(const UploadPhotoInitial()) {
    on<UploadPhotoRequested>(_onUploadPhotoRequested);
  }

  final _uploadImageRepository = locator<UploadImageRepository>();

  Future<void> _onUploadPhotoRequested(
    UploadPhotoRequested event,
    Emitter<UploadPhotoPageState> emit,
  ) async {
    emit(const UploadPhotoLoading());

    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 10,
        maxWidth: 768,
      );

      if (pickedFile == null) {
        emit(const UploadPhotoError('Resim seçilmedi'));
        return;
      }

      final result = await _uploadImageRepository.uploadPhoto(
        filePath: pickedFile.path,
      );

      emit(UploadPhotoSuccess(result != null));
    } catch (e) {
      emit(UploadPhotoError(e.toString()));
    }
  }
}
