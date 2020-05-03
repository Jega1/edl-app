import 'package:flutter/Material.dart';

class CompteurScre extends StatefulWidget {
  @override
  _CompteurScreState createState() => _CompteurScreState();
}

class _CompteurScreState extends State<CompteurScre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(

        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30.0, right: 15.0, bottom: 15.0, left: 15.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    color: Theme.of(context).primaryColorDark,
                    textColor: Theme.of(context).primaryColorLight,
                    child: Text(
                      'EDF',
                      textScaleFactor: 1.5,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                       '/edf-form');
                    },
                  ),
                ),

                Container(width: 5.0),

                Expanded(
                  child: RaisedButton(
                    color: Theme.of(context).primaryColorDark,
                    textColor: Theme.of(context).primaryColorLight,

                    child: Text(
                      'Gaz',
                      textScaleFactor: 1.5,
                    ),
                    onPressed: () {
                      // setState(() {
                      //    debugPrint("Delete button clicked");
                      //  });
                    },
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
