import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_upload/cubits/upload_info/upload_info_cubit.dart';

import 'get_all_info_from_database.dart';
class UplaodInfoScreen extends StatefulWidget {
   UplaodInfoScreen({Key? key}) : super(key: key);

  @override
  State<UplaodInfoScreen> createState() => _UplaodInfoScreenState();
}

class _UplaodInfoScreenState extends State<UplaodInfoScreen> {
  final txtName = TextEditingController();

  final txtFName = TextEditingController();

  final txtTitle = TextEditingController();

  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:  [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const GetAllInfoScreen()));
              },
                child: const Icon(Icons.shop)),
          ),
        ],
      ),
      body: ListView(
        children:  [
             TextField(
              controller: txtName,
              decoration: const InputDecoration(
                hintText: "Enter name ",
              ),
            ),
          const SizedBox(height: 20,),
           TextField(
            controller: txtFName,
            decoration: const InputDecoration(
              hintText: "Enter Father name ",
            ),
          ),
          const SizedBox(height: 20,),
           TextField(
            controller: txtTitle,
            decoration: const InputDecoration(
              hintText: "Enter title ",
            ),
          ),
          const SizedBox(height: 20,),
          MaterialButton(
            color: Colors.blue,
            onPressed: ()async{
              ImagePicker imagepicker = ImagePicker();
              XFile? xfile= await imagepicker.pickImage(source: ImageSource.camera);
              file = File(xfile!.path) ;
              if(file!=null)
                {
                  setState(() {

                  });
                }
          },
            child: const Text("select  Pic"),),
          const SizedBox(height: 20,),
          MaterialButton(
            color: Colors.blue,
            onPressed: (){
              Map<String,dynamic> data = ({
                'name': txtName.text,
                'FName': txtFName.text,
                'Tilte': txtTitle.text,
                'imgUrl': "",
              });
              context.read<UploadInfoCubit>().uploadInfoToDatabae(data, file!);
            },
            child: const Text("Upload Pic"),),
        ],
      ),
    );
  }
}
