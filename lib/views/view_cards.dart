import 'package:flutter/material.dart';
class ViewCards extends StatelessWidget {
  const ViewCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("View Cards"),),
      body: ListView(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Card(
              color: Colors.red,

            ),
          ),
        ],
      ),
    );
  }
}
