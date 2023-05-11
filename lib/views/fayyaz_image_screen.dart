import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_upload/cubits/upload_image/upload_image_cubit.dart';

class ShowAllImages extends StatelessWidget {
  const ShowAllImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<UploadImageCubit, UploadImageState>(
        builder: (context, state) {
          if(state is UploadImageLoading)
            {
              return const Center(child: CircularProgressIndicator(),);
            }
          if(state is UploadImageLoaded) {
            return ListView.builder(
              //itemCount: state.,
              itemBuilder: (context,index) {
                return Container(
                height: 300,
                width: 300,
                child: Card(
                  child: Image.network("src"),
                ),
          );
              }
            );
          }
          else {
          return SizedBox();
          }
        },


      ),
    );
  }
}
