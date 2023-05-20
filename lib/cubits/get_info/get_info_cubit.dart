import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_upload/models/get_info_model.dart';
import 'package:image_upload/repositories/get_info_repo.dart';
import 'package:meta/meta.dart';

part 'get_info_state.dart';

class GetInfoCubit extends Cubit<GetInfoState> {
  GetInfoCubit() : super(GetInfoInitial());
  getInfo()async
  {
    try{
      print("hello");
      List<GetInfoModel> list =[];
      emit(GetInfoLoading());
      var data =await GetInfoRepo.GetInfo();
       data.listen((event) {
         list.clear();
         for(var doc in event.docs)
           {
             list.add(GetInfoModel.fromJson(doc.data()));
           }
         emit(GetInfoLoaded(list: list));
       });

    }catch(e)
    {
      if(e is FirebaseException)
        {
          emit(GetInfoError(err: e.message.toString()));
        }
      if(e is SocketException)
      {
        emit(GetInfoError(err: e.message.toString()));
      }
      else
      {
        emit(GetInfoError(err: e.toString()));
      }
    }
  }
}
