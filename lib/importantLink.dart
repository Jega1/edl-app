
import 'package:flutter/material.dart';
//Date/Time picker FormFields
//https://flutterawesome.com/a-flutter-widget-that-wraps-a-textformfield-and-integrates-the-date-picker-dialogs/



///////////////////////////////
// Show Dialog function
void _showDialog(context) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return alert dialog object
      return AlertDialog(
        title: new Text('I am Title'),
        content: Container(
          height: 150.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Icon(Icons.toys),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: new Text(' First Item'),
                  ),
                ],
              ),
              new SizedBox(
                height: 20.0,
              ),
              new Row(
                children: <Widget>[
                  new Icon(Icons.toys),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: new Text(' Second Item'),
                  ),
                ],
              ),
              new SizedBox(
                height: 20.0,
              ),
              new Row(
                children: <Widget>[
                  new Icon(Icons.toys),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: new Text('Third Item'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}


///////////////////////////////



// Alert Dialog function
void _showAlertDialog( context) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return alert dialog object
      return AlertDialog(
        title: new Text("Alert Dialog title"),
        //content: new Text("Alert Dialog body"),
        actions: <Widget>[
          new FlatButton(
            child: new Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}



///////////////////////////////////////////////////////////////////////////

// replace this function with the examples above

 showAlertDialog(BuildContext context) {

  // set up the list options
  Widget optionOne = SimpleDialogOption(
    child: const Text('horse'),
    onPressed: () {
      print('horse');
      Navigator.of(context).pop();
      return "horse";
    },
  );
  Widget optionTwo = SimpleDialogOption(
    child: const Text('cow'),
    onPressed: () {
      print('cow');
      Navigator.of(context).pop();
      return "cow";
    },
  );
  Widget optionThree = SimpleDialogOption(
    child: const Text('camel'),
    onPressed: () {
      print('camel');
      Navigator.of(context).pop();
      return "camel";
    },
  );
  Widget optionFour = SimpleDialogOption(
    child: const Text('sheep'),
    onPressed: () {
      print('sheep');
      Navigator.of(context).pop();
      return "sheep";
    },
  );
  Widget optionFive = SimpleDialogOption(
    child: const Text('goat'),
    onPressed: () {
      print('goat');
      Navigator.of(context).pop();
      return "goat";
    },
  );

  // set up the SimpleDialog
  SimpleDialog dialog = SimpleDialog(
    title: const Text('Choose an animal'),

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
///////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////
//https://www.youtube.com/watch?v=CXyylpd5wqU ////The mobile programmer
// I have to test this mapping
//Map<String, dynamic> toMap(){
//var map = <String, dynamic>{
//  'id': id,
//};
//return map;
//}
/////////////////////////////////////////////////////////
//Bien.fromMap(Map<String, dynamic>map){
//id = map['id'];
//}
//////////////////////////////////////////////////////////////
