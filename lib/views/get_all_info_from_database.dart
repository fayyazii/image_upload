import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_upload/cubits/get_info/get_info_cubit.dart';

class GetAllInfoScreen extends StatefulWidget {
  const GetAllInfoScreen({Key? key}) : super(key: key);


  @override
  State<GetAllInfoScreen> createState() => _GetAllInfoScreenState();
}

class _GetAllInfoScreenState extends State<GetAllInfoScreen> {
  @override
  void initState() {
    context.read<GetInfoCubit>().getInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<GetInfoCubit, GetInfoState>(
        builder: (context, state) {
          if(state is GetInfoLoading)
            {
              return const Center(child: CircularProgressIndicator(),);
            }
          if(state is GetInfoError)
            {
              return Center(child: Text(state.err),);
            }
          if(state is GetInfoLoaded) {
            return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 20,),
                     Text(state.list[index].name),
                    const SizedBox(height: 20,),
                     Text(state.list[index].fName),
                    const SizedBox(height: 20,),
                     Text(state.list[index].title),
                    const SizedBox(height: 20,),
                    Container(
                      height: 200,
                      // width: 300,
                      color: Colors.red,
                      child: state.list[index].img.isEmpty?
                          Center(
                            child: Text("No image"),
                          )
                          :Image.network(state.list[index].img),
                    ),
                  ],
                );
              }
          );
          }else
            {
              return const SizedBox();
            }
        },
      ),
    );
  }
}
