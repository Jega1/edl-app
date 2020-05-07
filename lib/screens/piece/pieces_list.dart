import 'dart:core';
import 'package:flutter/material.dart';
import '../../importantLink.dart';
import 'add_piece_screen.dart';


class PieceList extends StatefulWidget {

  @override
  _PieceListState createState() => _PieceListState();
}

class _PieceListState extends State<PieceList> {

 List<String> pieces = [];

  @override
  void initState() {
    super.initState();
  //  pieces = List();
   // addPieces();
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
              dense: true,
            ),
          );
        }


      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  {
          //showFormDialog(context);
            showAlertDialog(context);
        //  pieces.add(name);
          var dummy = pieces;
          setState(() {
            pieces = dummy;
          });

        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),

    );
  }

}

