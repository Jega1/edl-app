import 'package:edl/utils/database_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:edl/widgets/menuDrawer.dart';
import '../../models/bien.dart';


class BienDetailsScreen extends StatefulWidget {
  final Bien bien;


  BienDetailsScreen({Key key, @required this.bien}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BienDetailsScreenState();
  }

}

class _BienDetailsScreenState extends State<BienDetailsScreen> {

  final _formKey = GlobalKey<FormState>();
  DatabaseHelper helper = DatabaseHelper();

  // TextEditingController idBienController = TextEditingController();
  //TextEditingController nameController = TextEditingController();


  Bien bien;

  @override
  Widget build(BuildContext context) {


    //testBien.idBien = bien.id;
    //testBien.name = bien.nom;

    //   idBienController.text = testBien.idBien;
    //   nameController.text = testBien.name;

    return Scaffold(
      appBar: AppBar(title: Text('${widget.bien.nom}'),
      ),
      drawer: MenuDrawer1(),
      body: Form(
        key: _formKey,

        child: ListView(

          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextFormField(
                //controller: idBienController,
                //   controller: idController,
                initialValue :'${widget.bien.id}',
                onChanged: (value) {
                },
                decoration: InputDecoration(
                    labelText: 'id de bien',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),


            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                //  controller: nameController,
                onChanged: (value) {
                  debugPrint('Something changed in Title Text Field');
                },
                decoration: InputDecoration(
                    labelText: 'name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: RaisedButton(
                color: Theme.of(context).primaryColorDark,
                textColor: Theme.of(context).primaryColorLight,
                child: Text(
                  'Save',
                  textScaleFactor: 1.5,
                ),
                onPressed: () async{
                  // var result = await helper.insertTestbien(testbien);
                  setState(() {
                    debugPrint("Save button clicked");
                  });
                  //  print(result);
                },
              ),
            ),


            Text('id: ${widget.bien.id}',
              textAlign: TextAlign.center ,
            ),
            Text('cop: ${widget.bien.idCopropriete}',
              textAlign: TextAlign.center ,
            ),
            Text('nom: ${widget.bien.nom}',
              textAlign: TextAlign.center ,
            ),
            Text('etage: ${widget.bien.etage}',
              textAlign: TextAlign.center ,
            ),

          ],
        ),

      ),

    );
  }




}