
import 'dart:convert';

import 'package:http/http.dart';
import 'package:image_upload/models/user_model.dart';

class UserPostsRepo{

 static Future<List<UserModel>> getPosts()async
 {
   String userUrl = "https://jsonplaceholder.typicode.com/posts";
   Response response = await get(Uri.parse(userUrl));
   if(response.statusCode==200)
     {
       final List result = jsonDecode(response.body);
       return result.map((e) => UserModel.fromJson(e)).toList();

     }
   else
   {
     throw Exception(response.reasonPhrase);
   }
 }
}