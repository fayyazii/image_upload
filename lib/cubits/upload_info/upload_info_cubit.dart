import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_upload/repositories/upload_info_pic.dart';
import 'package:image_upload/repositories/upload_info_repo.dart';
import 'package:meta/meta.dart';

part 'upload_info_state.dart';

class UploadInfoCubit extends Cubit<UploadInfoState> {
  UploadInfoCubit() : super(UploadInfoInitial());
  uploadInfoToDatabae(Map<String,dynamic> info , File file)async
  {
    try{
      emit(UploadInfoLoaded());
     var image = await UplaodInfoPic.upload(file);
     // info.putIfAbsent("imgUrl", () => image);
     info['imgUrl']=image;
      await UploadInfoRepo.uploadInfo(info);

      emit(UploadInfoLoaded());
    }catch(e)
    {
      if(e is FirebaseException)
        {
          emit(UploadInfoError(err: e.message.toString()));
        }
      if(e is SocketException)
      {
        emit(UploadInfoError(err: e.message.toString()));
      }
      else
      {
        emit(UploadInfoError(err: e.toString()));
      }
    }
  }
}
