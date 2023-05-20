import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
class UploadCardPicRepo{

  static Future<String> uploadCardPic(File file)async
  {
    Reference referenceroot = FirebaseStorage.instance.ref();
    Reference referenceDirImage = referenceroot.child('cardimages');
    Reference referenceImageUpload = referenceroot.child(DateTime.now().millisecondsSinceEpoch.toString());
    await referenceImageUpload.putFile(file);
    var img_url = await referenceImageUpload.getDownloadURL();
    return img_url;
  }
}