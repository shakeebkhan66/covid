import 'package:covid/dataSource.dart';
import 'package:flutter/material.dart';

class FaqsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQ's"),
      ),
      body: ListView.builder(
        itemCount: DataSource.questionAnswers.length,
          itemBuilder: (context, index){

        // ExpansionTile Widget in Flutter is a pretty simple yet useful widget.
        // This widget lets you create an expanding Tile that can be used as part of the ListView.
        // A lot of applications might require showing detailed information on the Listview
        // but do not have the required space to do that.

        return ExpansionTile(
            title: Text(
                DataSource.questionAnswers[index]["question"],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                DataSource.questionAnswers[index]["answer"]
              ),
            )
        ],
        );
      }),
    );
  }
}