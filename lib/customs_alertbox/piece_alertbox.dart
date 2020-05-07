import 'package:flutter/material.dart';

showAddPieceDialog(BuildContext context) {
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
  SimpleDialog dialog = SimpleDialog(

    title: const Text('Ajouter une piece'),
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
  //return "";
}


