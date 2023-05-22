import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_upload/cubits/card_cubits/get_card/get_card_cubit.dart';

class ViewCards extends StatefulWidget {
  const ViewCards({Key? key}) : super(key: key);


  @override
  State<ViewCards> createState() => _ViewCardsState();

}

class _ViewCardsState extends State<ViewCards> {
  @override
  void initState() {
    context.read<GetCardCubit>().getCard();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("View Cards"),),
      body: BlocBuilder<GetCardCubit, GetCardState>(
        builder: (context, state) {
          if(state is GetCardLoading)
            {
              return Center(child: CircularProgressIndicator(),);
            }
          if(state is GetCardError)
            {
              return Center(child: Text(state.err));
            }
          if(state is GetCardLoaded) {
            return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                return ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      child: Card(
                        color: Colors.white30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children:  [
                                Text(state.list[index].name),
                                Text(state.list[index].cnic),
                                Text(state.list[index].program),
                                Text(state.list[index].batch),
                                Text(state.list[index].group),
                              ],
                            ),
                            state.list[index].imgurl==null ? const SizedBox() :
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 8, bottom: 50),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                  height: 200,
                                  width: 200,
                                  child: Image.network(state.list[index].imgurl.toString() ),
                                ),
                              ),
                            )
                          ],
                        ),

                      ),
                    ),
                  ],
                );
              }

          );
          }
          else
            {
              return SizedBox();
            }
        },
      ),
    );
  }
}
