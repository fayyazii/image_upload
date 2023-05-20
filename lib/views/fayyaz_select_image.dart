import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_upload/repositories/_fayyaz_upload_image_repo.dart';
import 'package:image_upload/repositories/fayyaz_upload_data.dart';
import 'package:image_upload/views/fayyaz_image_screen.dart';

class SelectImage extends StatefulWidget {
   SelectImage({Key? key}) : super(key: key);

  @override
  State<SelectImage> createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {
  File? file;

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            color: Colors.blue,
            onPressed: ()async {
              try{
                ImagePicker imgPicker = ImagePicker();
                XFile? xFile = await imgPicker.pickImage(source: ImageSource.camera);
                file = File(xFile!.path);
                if(file!= null)
                  {
                    setState(() {});
                  }
              }catch(e)
              {

              }
            },
            child: const Text("Select Image"),
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () async{
              try{
                if(file!=null)
                  {
                    setState(() {});
                    String downloadURl = await FayyazUploadImageRepo.upload(file!);
                    var picinfo = await FayyazUplaodData.uploadData({
                      'imageURL' : downloadURl,
                      'date' : DateTime.now().millisecondsSinceEpoch,

                    });
                    print(picinfo);

                  }
              }catch(e)
              {}
            },
            child: const Text("Upload Image"),
          ),
          MaterialButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowAllImages()));
          },child: Text("show Images"),)
        ],
      ),
    );
  }
}
