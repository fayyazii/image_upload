import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_upload/repositories/_fayyaz_upload_image_repo.dart';
import 'package:meta/meta.dart';

part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit() : super(UploadImageInitial());
  uplaodData(File file)async
  {
    try{
      emit(UploadImageLoading());
      await FayyazUploadImageRepo.upload(file);
      emit(UploadImageLoaded());

    }catch(e)
    {
      if(e is FirebaseException)
        {
          emit(UploadImageError(err: e.message.toString()));
        }
      if(e is SocketException)
      {
        emit(UploadImageError(err: e.message.toString()));
      }
      else

      {
        emit(UploadImageError(err: e.toString()));
      }
    }

  }
}
