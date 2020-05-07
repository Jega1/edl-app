import 'package:edl/widgets/menuDrawer.dart';
import 'package:flutter/material.dart';

class PieceTapScreen extends StatefulWidget {
  @override
  _PieceTapScreenState createState() => _PieceTapScreenState();
}

class _PieceTapScreenState extends State<PieceTapScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      // initialIndex: 0,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Tab Piece'),

            bottom: TabBar(
              indicatorColor: Colors.yellowAccent,
              indicatorWeight: 3,

              tabs: <Widget>[
                Tab(
                  //icon: Icon(Icons.category),
                  text: 'Piece details',
                ),
                Tab(
                    //icon: Icon(Icons.star),
                    text: 'Equipement'),

                Tab(
                  //icon: Icon(Icons.star),
                    text: 'Meubles'),
              ],
            ),

          ),
          drawer: MenuDrawer(),
          body: TabBarView(
            children: <Widget>[
              Text('Piece details'),
              Text('Piece equipements'),
              Text('Piece equipements'),
             // CompteurList(),
             // CompteurScre(),

            ],
          )),
    );
  }
}

