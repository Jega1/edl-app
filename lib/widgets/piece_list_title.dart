import 'package:edl/models/piece.dart';
import 'package:flutter/material.dart';


class PieceListTile extends StatelessWidget {
  final Piece piece;

  final Function action;

  PieceListTile({this.piece, this.action, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 12.0, right: 12.0),
      child: GestureDetector(
        onTap: action,
        child: ListTile(
          leading: Icon(Icons.sd_storage),
          //title: Text(bien.nom,
          title: Text('Type de piece',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.pink),
          ),
          trailing: Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}