import 'package:edl/models/piece.dart';
import 'package:edl/utils/database_helper.dart';
import 'package:edl/widgets/piece_list_title.dart';
import 'package:flutter/material.dart';

class addPiece extends StatefulWidget {

  @override
  addPieceState createState() => addPieceState();
}

class addPieceState extends State<addPiece> {
  final typePieceController = TextEditingController();

  var piece = Piece();
  DatabaseHelper databaseHelper = DatabaseHelper();

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


      body: Column(
        children: <Widget>[
          PieceListTile(),

        ],
      ),






      floatingActionButton: FloatingActionButton(
        onPressed: () {
         // showFormDialog(context);
         // showAlertDialog(context);
          //Navigator.push(context, MaterialPageRoute(builder: (context) =>AddPieceScreen()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),


    );
  }





///////////////////////////////

  showAlertDialog(BuildContext context) {

    // set up the list options
    Widget optionOne = SimpleDialogOption(
      child: const Text('Room'),
      onPressed: () {
        print('Room');
        Navigator.of(context).pop();
      },
    );
    Widget optionTwo = SimpleDialogOption(
      child: const Text('Hall'),
      onPressed: () {
        print('Hall');
        Navigator.of(context).pop();
      },
    );
    Widget optionThree = SimpleDialogOption(
      child: const Text('kitchen'),
      onPressed: () {
        print('kitchen');
        Navigator.of(context).pop();
      },
    );
    Widget optionFour = SimpleDialogOption(
      child: const Text('office'),
      onPressed: () {
        print('office');
        Navigator.of(context).pop();
      },
    );
    Widget optionFive = SimpleDialogOption(
      child: const Text('WC'),
      onPressed: () {
        print('WC');
        Navigator.of(context).pop();
      },
    );

    // set up the SimpleDialog
    SimpleDialog dialog = SimpleDialog(
      title: const Text('Choose a piece'),

      children: <Widget>[
        optionOne,
        optionTwo,
        optionThree,
        optionFour,
        optionFive,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }


/////// 2nd ////////

  showFormDialog(BuildContext context){
    return showDialog(context: context, barrierDismissible: true,
        builder: (param){
          return AlertDialog(
            actions: <Widget>[
              FlatButton(
                onPressed: (){
                  print('creer une label : ${typePieceController.text}');
                  //piece.typePiece = typePieceController.text;
                  Piece piece;


                },
                child: Text('valider'),
              ),
              FlatButton(
                onPressed: (){},
                child: Text('Annuler'),
              )
            ],
            title: Text('Ajouter une piece'),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: typePieceController,
                    decoration: InputDecoration(
                      labelText: 'ajouter une piece',
                      hintText: 'add a label',

                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

}
