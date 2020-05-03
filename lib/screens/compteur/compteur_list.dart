import 'dart:async';
import 'package:edl/models/bien.dart';
import 'package:flutter/material.dart';
import '../../models/compteur.dart';
import '../../utils/database_helper.dart';
import 'compteur_detail.dart';
import 'package:sqflite/sqflite.dart';

class CompteurList extends StatefulWidget {

  final Bien bien;
  CompteurList({Key key, @required this.bien}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CompteurListState();
  }
}

class CompteurListState extends State<CompteurList> {

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Compteur> compteurList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (compteurList == null) {
      compteurList = List<Compteur>();
      updateListView();
    }

    return Scaffold(
      appBar: AppBar(
       // title: Text('${widget.bien.nom}'),
        title: Text('compteur detail'),
      ),
      body: getCompteurListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
          navigateToDetail(Compteur('', '', '', '', '', '', 2), 'Add compteur detail');
        },
        tooltip: 'Add compteur',
        child: Icon(Icons.add),
      ),
    );
  }



  ListView getCompteurListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor:
                  getPriorityColor(this.compteurList[position].priority),
              child: getPriorityIcon(this.compteurList[position].priority),
            ),
            title: Text(
              this.compteurList[position].type,
              style: titleStyle,
            ),

            subtitle: Text(this.compteurList[position].date),
            //subtitle: Text(this.Listcompteur[position].description),


            trailing: GestureDetector(
              child: Icon(
                Icons.delete,
                color: Colors.grey,
              ),
              onTap: () {
                _delete(context, compteurList[position]);
              },
            ),
            onTap: () {
              debugPrint("ListTile Tapped");
              navigateToDetail(this.compteurList[position], 'Edit compteur');
            },
          ),
        );
      },
    );
  }

  // Returns the priority color
  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.yellow;
        break;

      default:
        return Colors.yellow;
    }
  }

  // Returns the priority icon
  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icon(Icons.category);
        break;
      case 2:
        return Icon(Icons.keyboard_arrow_right);
        break;

      default:
        return Icon(Icons.keyboard_arrow_right);
    }
  }


  // Returns the priority color
  Color getTypeColor(int type) {
    switch (type) {
      case 1:
        return Colors.green;
        break;
      case 2:
        return Colors.deepPurpleAccent;
        break;

      default:
        return Colors.deepPurpleAccent;
    }
  }


  void _delete(BuildContext context, Compteur compteur) async {
    int result = await databaseHelper.deleteCompteur(compteur.id);
    if (result != 0) {
      _showSnackBar(context, 'Compteur Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(Compteur compteur, String title) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CompteurDetail(compteur, title);
    }));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Compteur>> compteurListFuture = databaseHelper.getCompteurList();
      compteurListFuture.then((compteurList) {
        setState(() {
          this.compteurList = compteurList;
          this.count = compteurList.length;
        });
      });
    });
  }
}
