import 'dart:core';
import 'package:edl/customs_alertbox/piece_alertbox.dart';
import 'package:flutter/material.dart';

import 'add_piece_screen.dart';


class PieceListScreen extends StatefulWidget {

  @override
  _PieceListScreenState createState() => _PieceListScreenState();
}

class _PieceListScreenState extends State<PieceListScreen> {

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
            showAddPieceDialog(context);
          //addPiece();
         // pieces.add(name);
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

