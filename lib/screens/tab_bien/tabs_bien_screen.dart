
import 'package:edl/widgets/bien_list_tile.dart';
import 'package:edl/widgets/menuDrawer.dart';
import 'package:flutter/material.dart';
import '../bien/bien_details_screen.dart';
import 'compteur_scre.dart';
import 'compteur_screen.dart';
import '../../models/bien.dart';
import '../compteur/compteur_list.dart';


class TabsBienScreen extends StatefulWidget {
  final Bien bien;

  TabsBienScreen({Key key, @required this.bien}) : super(key: key);

  @override
  TabsBienScreenState createState() => TabsBienScreenState();
}

class TabsBienScreenState extends State<TabsBienScreen> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      // initialIndex: 0,
      child: Scaffold(
          appBar: AppBar(

            title: Text('${widget.bien.nom}'),
            bottom: TabBar(
              indicatorColor: Colors.yellowAccent,
              indicatorWeight: 5,

             tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.category),
                  text: 'Compteur',
                ),
                Tab(icon: Icon(Icons.star),
                    text: 'Equipement'),
              ],
            ),

          ),
          drawer: MenuDrawer1(),
          body: TabBarView(
            children: <Widget>[
              //CompteurList(),
             // BienListTile(),
              //EquipementFormScreen(title: 'add equipement',),
              //CompteurScreen(),
             // User(),
              CompteurScre(),

            ],
          )),
    );
  }
}
