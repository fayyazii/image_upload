import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_upload/repositories/getimages.dart';
import 'package:meta/meta.dart';

part 'get_images_state.dart';

class GetImagesCubit extends Cubit<GetImagesState> {
  GetImagesCubit() : super(GetImagesInitial());
  getData()async
  {
    try{
      List list =[];
      emit(GetImagesLoading());
     var images = await GetImagesRepo.getImages();
     images.listen((event) {
       for(var doc in event.docs)
         {
           list.add(images);
         }
     });


    }catch(e)
    {
      if(e is FirebaseException)
        {
          emit(GetImagesError(err: e.message.toString()));
        }
      if(e is SocketException)
      {
        emit(GetImagesError(err: e.message.toString()));
      }
      else
      {
        emit(GetImagesError(err: e.toString()));
      }
      
    }
  }
}
