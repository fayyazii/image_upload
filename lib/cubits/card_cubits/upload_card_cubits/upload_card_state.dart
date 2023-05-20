part of 'upload_card_cubit.dart';


abstract class UploadCardState {}

class UploadCardInitial extends UploadCardState {}
class UploadCardLoading extends UploadCardState {}
class UploadCardLoaded extends UploadCardState {}
class UploadCardError extends UploadCardState {
  String err;
  UploadCardError({required this.err});
}
