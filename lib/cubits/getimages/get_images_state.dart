part of 'get_images_cubit.dart';


abstract class GetImagesState {}

class GetImagesInitial extends GetImagesState {}
class GetImagesLoading extends GetImagesState {}
class GetImagesLoaded extends GetImagesState {
  List<ImagesModel> images;
  GetImagesLoaded({required this.images});
}
class GetImagesError extends GetImagesState {
  String err;
  GetImagesError({required this.err});
}
