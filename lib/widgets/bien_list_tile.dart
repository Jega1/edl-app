import 'package:edl/models/testbien.dart';
import 'package:flutter/material.dart';
import '../models/bien.dart';

class BienListTile extends StatelessWidget {
  final Bien bien;

  final Function action;

  BienListTile({this.bien, this.action, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 12.0, right: 12.0),
      child: GestureDetector(
        onTap: action,
        child: ListTile(
                leading: Icon(Icons.home),
                title: Text(bien.nom,
                  style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink),
                ),
                  subtitle: Text(bien.adresse,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey),),
                  trailing: Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}