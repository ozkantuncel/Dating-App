part of 'image_upload_page_bloc.dart';

@immutable
sealed class UploadPhotoPageState extends Equatable {
  const UploadPhotoPageState();
}

final class UploadPhotoInitial extends UploadPhotoPageState {
  const UploadPhotoInitial();

  @override
  List<Object> get props => [];
}

final class UploadPhotoLoading extends UploadPhotoPageState {
  const UploadPhotoLoading();

  @override
  List<Object> get props => [];
}

final class UploadPhotoSuccess extends UploadPhotoPageState {
  final bool result;

  const UploadPhotoSuccess(this.result);

  @override
  List<Object> get props => [result];
}

final class UploadPhotoError extends UploadPhotoPageState {
  final String errorMessage;

  const UploadPhotoError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}