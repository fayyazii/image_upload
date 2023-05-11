
import 'package:cloud_firestore/cloud_firestore.dart';

class GetImagesRepo{
  static Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getImages()async
  {
    var images = await FirebaseFirestore.instance.collection("data").snapshots();
    return images;
  }
}