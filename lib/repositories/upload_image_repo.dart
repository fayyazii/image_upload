import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class UploadImageRepo
{
  static Future<String> upload(File file)async{
    try{
      var ref=FirebaseStorage.instance.ref(
          "images/${DateTime.now().millisecondsSinceEpoch}${file.path.split("/").last}");
      var upload=await ref.putFile(file);

      return await upload.ref.getDownloadURL();
    }catch(e){
      return e.toString();
    }
  }
}