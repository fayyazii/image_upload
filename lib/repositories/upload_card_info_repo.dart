
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadCardInfoRepo{

  static Future uploadInfo(Map<String,dynamic> data )async
  {
    var ref = FirebaseFirestore.instance.collection("cardinfo");
    await ref.add(data);
    return ref;
  }


}