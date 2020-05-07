import 'package:flutter/Material.dart';


class GeneralScreen extends StatefulWidget {
  @override
  _GeneralScreenState createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
          child: Icon(Icons.add),
          backgroundColor: Colors.pink,
        ),

      body:Column(

      ));
  }
}
