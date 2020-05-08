import 'package:edl/screens/description_screen.dart';
import 'package:edl/screens/informations/info_screen.dart';
import 'package:edl/screens/piece/pieces_list_screen.dart';
import 'package:edl/screens/tab_bien/tabs_bien_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(

          children: <Widget>[
                Container(
                    padding: const EdgeInsets.only(top: 50.0, left: 40.0),
                    width: double.infinity,
                    height: 250.0,
                    color: Colors.pink,

                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Icon(
                          Icons.account_circle,
                          size: 70.0,
                          color: Colors.white,
                        ),
                        SizedBox(
                            height:20.0),
                        Text('Agence',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                        ),
                        SizedBox(
                            height:10.0),
                        Text('jega@gmail.com',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                ),

            CustomListTile(Icons.info, 'Informations', () => {}),
            //CustomistTile(Icons.home,'Bien',() => {Navigator.of(context).pushNamed('/tabs-bien-screen'),}),
            CustomListTile(Icons.home,'Bien',() => {Navigator.of(context).push(MaterialPageRoute(builder: (_) => TabsBienScreen()))}),
          //  CustomListTile(Icons.home,'Bien',() => {Navigator.of(context).push(MaterialPageRoute(builder: (_) => CompteurList()))}),
            CustomListTile(Icons.category, 'Pièces', () => {Navigator.of(context).push(MaterialPageRoute(builder: (_) => PieceListScreen()))}),
            CustomListTile(Icons.lock, 'Clès', () => {Navigator.of(context).push(MaterialPageRoute(builder: (_) => DescriptionScreen()))}),
            CustomListTile(Icons.book, 'Signature', () => {}),
            CustomListTile(Icons.pages, 'Documents', () => {}),
          ],
        ));
  }
}

class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.pink.shade400)),
        ),
        child: InkWell(
            splashColor: Colors.pinkAccent,
            onTap: onTap,
            child: Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(icon),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          text,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_right)
                ],
              ),
            )),
      ),
    );
  }
}


