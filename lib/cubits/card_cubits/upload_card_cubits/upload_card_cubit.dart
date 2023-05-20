
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_upload/repositories/upload_card_info_repo.dart';
import 'package:image_upload/repositories/upload_card_pic_repo.dart';
import 'package:meta/meta.dart';

part 'upload_card_state.dart';

class UploadCardCubit extends Cubit<UploadCardState> {
  UploadCardCubit() : super(UploadCardInitial());
  uploadCard(Map<String,dynamic> data , File file)async
  {
    try{
      emit(UploadCardLoading());
      var image = await UploadCardPicRepo.uploadCardPic(file);
      data['imgUrl'] = image;
      UploadCardInfoRepo.uploadInfo(data);
      emit(UploadCardLoaded());
    }catch(e)
    {
      if(e is FirebaseException)
        {
          emit(UploadCardError(err: e.message.toString()));
        }
      if(e is SocketException)
      {
        emit(UploadCardError(err: e.message.toString()));
      }
      else
      {
        emit(UploadCardError(err: e.toString()));
      }
    }
  }
}
