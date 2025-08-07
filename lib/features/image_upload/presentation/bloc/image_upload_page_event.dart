part of 'image_upload_page_bloc.dart';


sealed class UploadPhotoPageEvent extends Equatable {
  const UploadPhotoPageEvent();

  @override
  List<Object> get props => [];
}

final class UploadPhotoRequested extends UploadPhotoPageEvent {}
