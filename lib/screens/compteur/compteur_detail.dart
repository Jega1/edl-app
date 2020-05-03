
import 'package:edl/models/bien.dart';
import 'package:flutter/material.dart';
import '../../models/compteur.dart';
import '../../utils/database_helper.dart';
import 'package:intl/intl.dart';

class CompteurDetail extends StatefulWidget {


  //final Bien bien:

  final String appBarTitle;
  final Compteur compteur;
  CompteurDetail(this. compteur, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return CompteurDetailState(this.compteur, this.appBarTitle);
  }
}

class CompteurDetailState extends State<CompteurDetail> {

  static var _priorities = ['High', 'Low'];
  static var _types = ['EDF', 'GAZ'];

  DatabaseHelper helper = DatabaseHelper();

  String appBarTitle;
  Compteur compteur;


  TextEditingController numComptController = TextEditingController();
  TextEditingController hpController = TextEditingController();
  TextEditingController hcController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
 // final _formKey = new GlobalKey<FormState>();

  CompteurDetailState(this.compteur, this.appBarTitle);

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.title;

    numComptController.text = compteur.numCompt;
    hpController.text = compteur.hp;
    hcController.text = compteur.hc;
    titleController.text = compteur.title;
    descriptionController.text = compteur.description;

    return WillPopScope(

        onWillPop: () {
          // Write some code to control things, when user press Back navigation button in device navigationBar
          moveToLastScreen();
        },

        child: Scaffold(
          appBar: AppBar(
            title: Text(appBarTitle),
            leading: IconButton(icon: Icon(
                Icons.arrow_back),
                onPressed: () {
                  // Write some code to control things, when user press back button in AppBar
                  moveToLastScreen();
                }
            ),
          ),

          body: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: ListView(
              children: <Widget>[
                // First element
                ListTile(
                  title: DropdownButton(
                      items: _priorities.map((String dropDownStringItem) {
                        return DropdownMenuItem<String> (
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),

                      style: textStyle,
                      value: getPriorityAsString(compteur.priority),

                      onChanged: (valueSelectedByUser) {
                        setState(() {
                          debugPrint('User selected $valueSelectedByUser');
                          updatePriorityAsInt(valueSelectedByUser);
                        });
                      }
                  ),
                ),

                ListTile(
                  title: DropdownButton(
                      items: _types.map((String dropDownStringItem) {
                        return DropdownMenuItem<String> (
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),

                      style: textStyle,

                      value: getTypeAsString(compteur.type),

                      onChanged: (valueSelectedByUser) {
                        setState(() {
                          debugPrint('User selected $valueSelectedByUser');
                          updateTypeAsString(valueSelectedByUser);
                        });
                      }
                  ),
                ),






                // Numero de compte
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: numComptController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field');
                      updateNumCompt();
                    },
                    decoration: InputDecoration(
                        labelText: 'Numero de compte',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),


            // HP
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: hpController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field');
                      updateHp();
                    },
                    decoration: InputDecoration(
                        labelText: 'HP',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),

          // HC
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: hcController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field');
                      updateHc();
                    },
                    decoration: InputDecoration(
                        labelText: 'HC',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),




                // Second Element
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: titleController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field');
                      updateTitle();
                    },
                    decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),

                // Third Element
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: descriptionController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in Description Text Field');
                      updateDescription();
                    },
                    decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),

                // Fourth Element
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            'Save',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint("Save button clicked");
                              _save();
                            });
                          },
                        ),
                      ),

                      Container(width: 5.0,),

                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            'Delete',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint("Delete button clicked");
                              _delete();
                            });
                          },
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),

        ));
  }



  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  // Convert the String priority in the form of integer before saving it to Database
  void updatePriorityAsInt(String value) {
    switch (value) {
      case 'High':
        compteur.priority = 1;
        break;
      case 'Low':
        compteur.priority = 2;
        break;
    }
  }

  // Convert int priority to String priority and display it to user in DropDown
  String getPriorityAsString(int value) {
    String priority;
    switch (value) {
      case 1:
        priority = _priorities[0];  // 'High'
        break;
      case 2:
        priority = _priorities[1];  // 'Low'
        break;
    }
    return priority;
  }

  // Convert the String priority in the form of integer before saving it to Database
  void updateTypeAsString(String value) {
    switch (value) {
      case 'EDF':
        compteur.type = "EDF";
        break;
      case 'GAZ':
        compteur.type = "GAZ";
        break;
    }
  }

  // Convert int priority to String priority and display it to user in DropDown
  String getTypeAsString(String value) {
    String type;
    switch (value) {
      case "EDF":
        type = _types[0];  // 'High'
        break;
      case "GAZ":
        type = _types[1];  // 'Low'
        break;
    }
    return type;
  }




  // Update the number of counter & compteur object
  void updateNumCompt(){
    compteur.numCompt = numComptController.text;
  }
  // Update the HP of compteur object
  void updateHp(){
    compteur.hp = hpController.text;
  }
  // Update the HC of compteur object
  void updateHc(){
    compteur.hc = hcController.text;
  }
  // Update the title of Compteur object
  void updateTitle(){
    compteur.title = titleController.text;
  }

  // Update the description of Compteur object
  void updateDescription() {
    compteur.description = descriptionController.text;
  }

  // Save data to database
  void _save() async {
    moveToLastScreen();

    compteur.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if (compteur.id != null) {  // Case 1: Update operation
      result = await helper.updateCompteur(compteur);
    } else { // Case 2: Insert Operation
      result = await helper.insertCompteur(compteur);
    }

    if (result != 0) {  // Success
      _showAlertDialog('Status', 'Compteur Saved Successfully');
    } else {  // Failure
      _showAlertDialog('Status', 'Problem Saving Compteur');
    }

  }

  void _delete() async {
    moveToLastScreen();

    // Case 1: If user is trying to delete the NEW COMPTEUR i.e. he has come to
    // the detail page by pressing the FAB of cOMPTEUR list page.
    if (compteur.id == null) {
      _showAlertDialog('Status', 'No Note was deleted');
      return;
    }

    // Case 2: User is trying to delete the old note that already has a valid ID.
    int result = await helper.deleteCompteur(compteur.id);
    if (result != 0) {
      _showAlertDialog('Status', 'Note Deleted Successfully');
    } else {
      _showAlertDialog('Status', 'Error Occured while Deleting Note');
    }
  }

  void _showAlertDialog(String title, String message) {

    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
        context: context,
        builder: (_) => alertDialog
    );
  }

}
