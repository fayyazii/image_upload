
import 'package:cloud_firestore/cloud_firestore.dart';

class GetCardRepo{

  static Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getCard()async
  {
    var ref = FirebaseFirestore.instance.collection('cardinfo').snapshots();
    return ref ?? Stream.empty();
  }

}