import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_upload/cubits/user_posts/user_posts_cubit.dart';

class UserPostsScreen extends StatefulWidget {
  const UserPostsScreen({Key? key}) : super(key: key);

  @override
  State<UserPostsScreen> createState() => _UserPostsScreenState();
}

class _UserPostsScreenState extends State<UserPostsScreen> {
  @override
  void initState() {
   context.read<UserPostsCubit>().getPosts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<UserPostsCubit, UserPostsState>(
        builder: (context, state) {
          if(state is UserPostsLoading)
            {
              return const Center(child: CircularProgressIndicator(),);
            }
          if(state is UserPostsError)
            {
              return Center(child: Text(state.err),);
            }
          if(state is UserPostsLoaded) {
            return ListView.builder(
              itemCount: state.postsList.length,
              itemBuilder: (context, index) {
                return Column(

                  children:  [
                    Text(
                      state.postsList[index].userId.toString()
                    ),
                    Text(state.postsList[index].id.toString()),
                    Text(state.postsList[index].title),
                    Text(state.postsList[index].body),
                  ],
                );
              }
          );
          }
          else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
