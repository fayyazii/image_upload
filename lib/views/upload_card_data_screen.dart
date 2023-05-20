import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_upload/cubits/card_cubits/upload_card_cubits/upload_card_cubit.dart';

class UplaodcardDatascreen extends StatelessWidget {
  UplaodcardDatascreen({Key? key}) : super(key: key);
  final txtName = TextEditingController();
  final txtCNIC = TextEditingController();
  final txtProgram = TextEditingController();
  final txtBatch = TextEditingController();
  final txtGroup = TextEditingController();
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload card info"),
      ),
      body: ListView(
        children: [

          TextField(
            controller: txtName,
            decoration: const InputDecoration(
                hintText: "Enter Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                )
            ),
          ),
          const SizedBox(height: 10,),
          TextField(
            controller: txtCNIC,
            decoration: const InputDecoration(
                hintText: "Enter CNIC",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                )
            ),
          ),
          const SizedBox(height: 10,),
          TextField(
            controller: txtProgram,
            decoration: const InputDecoration(
                hintText: "Enter Program",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                )
            ),
          ),
          const SizedBox(height: 10,),
          TextField(
            controller: txtBatch,
            decoration: const InputDecoration(
                hintText: "Enter Batch",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                )
            ),

          ),
          const SizedBox(height: 10,),
          TextField(
            controller: txtGroup,
            decoration: const InputDecoration(
                hintText: "Enter Group",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                )
            ),
          ),
          const SizedBox(height: 20,),
          InkWell(
            onTap: () async
            {
              ImagePicker imagePicker = ImagePicker();
              XFile? xFile = await imagePicker.pickImage(
                  source: ImageSource.camera);
              file = File(xFile!.path);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)
              ),

              height: 200,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.upload),
                  Text("Upload image")
                ],
              ),
            ),
          ),
          BlocBuilder<UploadCardCubit, UploadCardState>(
            builder: (context, state) {
              if(state is UploadCardLoading)
                {
                  return const Center(child: CircularProgressIndicator(),);
                }
              if(state is UploadCardError)
                {
                  return Center(child:Text(state.err) ,);
                }
              if(state is UploadCardLoaded) {
                return MaterialButton(
                color: Colors.green,
                onPressed: () async
                {
                  var data = await getPayLoad();
                  context.read<UploadCardCubit>().uploadCard(data, file!);
                  data.clear();
                },
                child: const Text("Upload"),);
              }
              else {
                return  Container(height: 100,
                  color: Colors.red,);
              }

            },
          ),


        ],
      ),
    );
  }

  Future<Map<String, dynamic>> getPayLoad() async
  {
    return {
      "name": txtName.text,
      "cnic": txtCNIC.text,
      "program": txtProgram.text,
      "batch": txtBatch.text,
      "group": txtGroup.text,
      "imgUrl": ""
    };
  }
}
