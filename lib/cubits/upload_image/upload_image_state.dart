part of 'upload_image_cubit.dart';


abstract class UploadImageState {}

class UploadImageInitial extends UploadImageState {}
class UploadImageLoading extends UploadImageState {}
class UploadImageLoaded extends UploadImageState {}
class UploadImageError extends UploadImageState {
  String err;
  UploadImageError({required this.err});
}

