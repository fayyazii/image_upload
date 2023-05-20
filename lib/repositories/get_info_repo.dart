
import 'package:cloud_firestore/cloud_firestore.dart';

class GetInfoRepo{

  static Future<Stream<QuerySnapshot<Map<String, dynamic>>>>  GetInfo()async
  {
    var ref = FirebaseFirestore.instance.collection('Info').snapshots();
    return ref;
  }
}