part of 'user_posts_cubit.dart';

@immutable
abstract class UserPostsState {}

class UserPostsInitial extends UserPostsState {}
class UserPostsLoading extends UserPostsState {}
class UserPostsLoaded extends UserPostsState {
  List<UserModel> postsList;
  UserPostsLoaded({required this.postsList});
}
class UserPostsError extends UserPostsState {
  String err;
  UserPostsError({required this.err});
}
