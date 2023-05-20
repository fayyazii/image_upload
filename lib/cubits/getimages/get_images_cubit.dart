import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_upload/models/images_model.dart';
import 'package:image_upload/repositories/getimages.dart';
import 'package:meta/meta.dart';

part 'get_images_state.dart';

class GetImagesCubit extends Cubit<GetImagesState> {
  GetImagesCubit() : super(GetImagesInitial()){
    getData();
  }
  getData()async
  {
    print("hello");
    try{
      List<ImagesModel> list =[];
      emit(GetImagesLoading());
     var images = await GetImagesRepo.getImages();
     images.listen((event) {
       list.clear();
       for(var doc in event.docs)
         {
           list.add(ImagesModel.fromJson(doc.data()));
         }
       emit(GetImagesLoaded(images: list));
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
