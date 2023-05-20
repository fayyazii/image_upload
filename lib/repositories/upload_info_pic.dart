
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class UplaodInfoPic{

  static Future upload(File file)async
  {
    Reference referenceroot = FirebaseStorage.instance.ref();
    Reference referenceDirImage = referenceroot.child("infoimages");
    Reference referenceImagetoUpload = referenceDirImage.child(DateTime.now().millisecondsSinceEpoch.toString());
    await referenceImagetoUpload.putFile(file);
    var imgUrl = await referenceImagetoUpload.getDownloadURL();
    return imgUrl;
  }
}