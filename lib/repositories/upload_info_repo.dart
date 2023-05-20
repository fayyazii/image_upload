

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class UploadInfoRepo{

  static Future uploadInfo(Map<String,dynamic> info, )async
  {
    var ref = FirebaseFirestore.instance.collection("Info").add(info);
    return ref;

  }


}