import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_upload/cubits/card_cubits/get_card/get_card_cubit.dart';
import 'package:image_upload/cubits/card_cubits/upload_card_cubits/upload_card_cubit.dart';
import 'package:image_upload/cubits/get_info/get_info_cubit.dart';
import 'package:image_upload/cubits/getimages/get_images_cubit.dart';
import 'package:image_upload/cubits/upload_image/upload_image_cubit.dart';
import 'package:image_upload/cubits/upload_info/upload_info_cubit.dart';
import 'package:image_upload/cubits/user_posts/user_posts_cubit.dart';
import 'package:image_upload/views/fayyaz_image_screen.dart';
import 'package:image_upload/views/fayyaz_select_image.dart';
import 'package:image_upload/views/get_all_info_from_database.dart';
import 'package:image_upload/views/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_upload/views/show_images.dart';
import 'package:image_upload/views/upload_card_data_screen.dart';
import 'package:image_upload/views/upload_info_to_database.dart';
import 'package:image_upload/views/user_posts_screen.dart';
import 'package:image_upload/views/view_cards.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>UploadImageCubit()),
        BlocProvider(create: (context)=>GetImagesCubit()),
        BlocProvider(create: (context)=>UploadInfoCubit()),
        BlocProvider(create: (context)=>GetInfoCubit()),
        BlocProvider(create: (context)=>UploadCardCubit()),
        BlocProvider(create: (context)=>GetCardCubit()),
        BlocProvider(create: (context)=>UserPostsCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: UserPostsScreen(),
      ),
    );
  }
}


