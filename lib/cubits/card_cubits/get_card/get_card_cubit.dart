import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_upload/models/get_card_model.dart';
import 'package:image_upload/repositories/get_card_repo.dart';
import 'package:meta/meta.dart';

part 'get_card_state.dart';

class GetCardCubit extends Cubit<GetCardState> {
  GetCardCubit() : super(GetCardInitial());
  getCard()async
  {
    try{
      print("loaded");
      List<GetCardModel> list = [];
      emit(GetCardLoading());
      var data = await GetCardRepo.getCard();
      data.listen((event) {
        print("data received");
        list.clear();
        for(var doc in event.docs)
          {
            list.add(GetCardModel.fromJson(doc.data()));
          }
        emit(GetCardLoaded(list: list));
      });

    }catch(e)
    {
      if(e is FirebaseException)
        {
          emit(GetCardError(err: e.message.toString()));
        }
      if(e is SocketException)
      {
        emit(GetCardError(err: e.message.toString()));
      }
      else
      {
        emit(GetCardError(err: e.toString()));
      }
    }
  }
}
