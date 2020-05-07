import 'package:edl/widgets/menuDrawer.dart';
import 'package:flutter/material.dart';
import 'compteur/compteur_list.dart';
import 'general_screen.dart';



class TabsBienScreen extends StatefulWidget {


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

            title: Text('Tab bien'),
            bottom: TabBar(
              indicatorColor: Colors.yellowAccent,
              indicatorWeight: 5,

             tabs: <Widget>[
                Tab(
                  //icon: Icon(Icons.category),
                  text: 'Compteur',
                ),
                Tab(
                    //icon: Icon(Icons.star),
                    text: 'Général'),
              ],
            ),

          ),
          drawer: MenuDrawer(),
          body: TabBarView(
            children: <Widget>[
              CompteurList(),
              GeneralScreen(),

            ],
          )),
    );
  }
}
