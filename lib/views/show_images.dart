import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowImages extends StatelessWidget {
  const ShowImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getImages(),
        builder: (BuildContext context,
            AsyncSnapshot<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
                snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text("No images found"),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                var data = snapshot.data![index];
                return SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(data['image']),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getImages() async {
    var ref = FirebaseFirestore.instance.collection("data");
    var snapshots = await ref.get();
    return snapshots.docs;
  }
}
