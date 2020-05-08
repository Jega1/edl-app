import 'package:flutter/material.dart';

class PieceDetailScreen extends StatefulWidget {
  @override
  _PieceDetailScreenState createState() => _PieceDetailScreenState();
}

class _PieceDetailScreenState extends State<PieceDetailScreen> {

  List<String> pieceDtails = ['wall', 'window', 'door', 'floor'];

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: pieceDtails.length,
          itemBuilder: (BuildContext context, int index) {
            return  Card(
              elevation: 10,
              child: ListTile(
                title: Text(pieceDtails[index]),
                dense: true,


              ),
            );
          }


      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  {

        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),

    );
  }
}
