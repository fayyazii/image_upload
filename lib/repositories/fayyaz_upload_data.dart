
import 'package:cloud_firestore/cloud_firestore.dart';

class FayyazUplaodData{

  static Future uploadData(Map<String,dynamic> data)async
  {
    var ref =FirebaseFirestore.instance.collection("data");
    await ref.add(data);
  }

}