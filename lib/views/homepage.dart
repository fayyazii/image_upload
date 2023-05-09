import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_upload/repositories/firestore_data_upload.dart';
import 'package:image_upload/repositories/upload_image_repo.dart';

class HomePage extends StatefulWidget {
    const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
        MaterialButton(
          color: Colors.blue,
          onPressed: () {},
          child: const Text("Select Image"),
        ),
        isLoading?const Center(
          child: CircularProgressIndicator(),
        ) :MaterialButton(
          color: Colors.blue,
          onPressed: ()async {
            try{
              setState(() {
                isLoading=true;
              });
              XFile? file=await ImagePicker().pickImage(source: ImageSource.gallery);
              if(file!=null){
                String downloadURL=await UploadImageRepo.upload(File(file.path));
                await FirestoreDataUpload.uploadData({
                  'image':downloadURL,
                  'date':DateTime.now().millisecondsSinceEpoch
                });
                setState(() {
                  isLoading=false;
                });
                print("uploaded");
              }
            }catch(e){
              setState(() {
                isLoading=false;
              });
              print(e.toString());
            }
          },
          child: const Text("Upload Image"),
        ),
      ]),
    );
  }
}
