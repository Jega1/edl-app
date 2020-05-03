import 'package:flutter/material.dart';
import 'bien/bien_list_screen.dart';


class TypeEdlScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Selection de type de edl'),
          centerTitle: true,
        ),
        body: Center(

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('choisissez vos edl',
                  style: TextStyle(
                    color: Colors.black87,
                    letterSpacing: 1.0,
                    fontSize: 20.0,
                  )),
              SizedBox(height: 50.0),

              RaisedButton(
                child: Text('Entrée',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    )),
                color: Colors.pink,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                   builder: (context) => BienListScreen(),)
                  );
                },
              ),


              SizedBox(height: 50.0),
              RaisedButton(
                child: Text('Sortie',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    )),
                color: Colors.pink,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    //'/note-detail-screen',
                    '/note-screen',
                  );
                },
              ),

            ],
          ),

        ),
    );
  }
}
