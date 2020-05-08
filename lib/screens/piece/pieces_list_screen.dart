import 'dart:core';
import 'package:edl/custom_dialogbox/piece_dialogbox.dart';
import 'package:flutter/material.dart';



class PieceListScreen extends StatefulWidget {

  @override
  _PieceListScreenState createState() => _PieceListScreenState();
}

class _PieceListScreenState extends State<PieceListScreen> {
  TextEditingController textEditingController = TextEditingController();

  List<String> pieces = ['Room', 'hall','kitchen', 'wc'];

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Piece'),
      ),


      body: ListView.builder(
        itemCount: pieces.length,
        itemBuilder: (BuildContext context, int index) {
          return  Card(
            elevation: 10,
            child: ListTile(
              title: Text(pieces[index]),
              subtitle: new Text(
                  "Decription : You may go now!!"
              ),
              dense: true,
            ),
          );
        }


      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  {
           showAddPieceDialog(context, textEditingController);
           // var dummy = pieces;
          //setState(() {
            //pieces = dummy;
          //});
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),

    );
  }


}

