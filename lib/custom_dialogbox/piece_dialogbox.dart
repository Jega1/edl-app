import 'package:edl/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:edl/models/edl.dart';
import 'package:edl/models/piece.dart';

showAddPieceDialog(BuildContext context, TextEditingController addPiece) {

  // set up the list options
  Widget optionOne = SimpleDialogOption(
    child: const Text('Living room'),
    onPressed: () {
      print('Living room');
      Navigator.of(context).pop();
      return "living room";
    },
  );
  Widget optionTwo = SimpleDialogOption(
    child: const Text('Room'),
    onPressed: () {
      print('Room');
      Navigator.of(context).pop();
      return "room";
    },
  );
  Widget optionThree = SimpleDialogOption(
    child: const Text('office'),
    onPressed: () {
      print('office');
      Navigator.of(context).pop();
      return "office";
    },
  );
  Widget optionFour = SimpleDialogOption(
    child: const Text('Kitchen'),
    onPressed: () {
      print('Kitchen');
      Navigator.of(context).pop();
      return "kitchen";
    },
  );
  Widget optionFive = SimpleDialogOption(
    child: const Text('WC'),
    onPressed: () {
      print('WC');
      Navigator.of(context).pop();
      return "wc";
    },
  );

  // set up the SimpleDialog


  // show the dialog
  showDialog(
    context: context,
      builder: (BuildContext context) {
      Edl edl;
      return SimpleDialog(
        title: TextField(
          controller: addPiece,
        ),
        children: <Widget>[
          optionOne,
          optionTwo,
          optionThree,
          optionFour,
          optionFive,
          RaisedButton(
            onPressed: () async {
              Edl edl;
              String id_edl;
              Piece piece = Piece(id_edl: int.parse(id_edl), typePiece: 'none') ;
              DatabaseHelper databaseHelper = DatabaseHelper();
                  await databaseHelper.insertPiece(piece).then((id){
                    piece.setPiece(id);
                    print(piece.idPiece);
                  });



            },
            child: Text('Save', style: TextStyle(fontSize: 20)),
          ),
        ],

      );

    },
    );
}

