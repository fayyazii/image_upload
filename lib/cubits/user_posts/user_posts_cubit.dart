import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_upload/repositories/user_posts_repo.dart';
import 'package:meta/meta.dart';


import '../../models/user_model.dart';

part 'user_posts_state.dart';

class UserPostsCubit extends Cubit<UserPostsState> {
  UserPostsCubit() : super(UserPostsInitial());
  getPosts()async
  {
    List<UserModel> list=[];
    //try{
      emit(UserPostsLoading());
      var data = await UserPostsRepo.getPosts();

      emit(UserPostsLoaded(postsList: data));


    // }catch(e)
    // {
    //   if(e is SocketException)
    //     {
    //       emit(UserPostsError(err: e.message.toString()));
    //     }
    //   if(e is HttpException)
    //   {
    //     emit(UserPostsError(err: e.message.toString()));
    //   }
    //   else
    //   {
    //     emit(UserPostsError(err: e.toString()));
    //   }
    // }
  }
}
