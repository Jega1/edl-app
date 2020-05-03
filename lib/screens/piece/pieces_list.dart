import 'package:edl/models/piece.dart';
import 'package:flutter/material.dart';


class PieceList extends StatefulWidget {


  @override
  _PieceListState createState() => _PieceListState();
}

class _PieceListState extends State<PieceList> {


  @override
  void initState() {
    super.initState();
    //apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Piece'),
      ),
      body: Container(


      ),
    );
  }
}
