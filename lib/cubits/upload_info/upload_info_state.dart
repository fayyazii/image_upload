part of 'upload_info_cubit.dart';


abstract class UploadInfoState {}

class UploadInfoInitial extends UploadInfoState {}
class UploadInfoLoading extends UploadInfoState {}
class UploadInfoLoaded extends UploadInfoState {}
class UploadInfoError extends UploadInfoState {
  String err;
  UploadInfoError({required this.err});
}
