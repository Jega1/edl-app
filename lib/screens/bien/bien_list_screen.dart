import 'dart:core';
import 'package:edl/models/edl.dart';
import 'package:edl/screens/piece/piece_tap/piece_tap.dart';
import 'package:edl/screens/tab_bien/tabs_bien_screen.dart';
import 'package:edl/utils/database_helper.dart';
import 'bien_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../models/bien.dart';
import '../../widgets/bien_list_tile.dart';
import '../../services/bien_service.dart';
import '../../models/testbien.dart';


class BienListScreen extends StatefulWidget {


  @override
  BienListScreenState createState() => BienListScreenState();
}

class BienListScreenState extends State<BienListScreen> {
  ApiService apiService;


  @override
  void initState(){
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('list de bien pour faire edl'),
        centerTitle: true,
      ),

      body: Container(
          child: FutureBuilder(
              future: apiService.getBiens(),
              builder: (context, snapshot) {
                if (snapshot.hasData){
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index){
                      Bien bien = snapshot.data[index];
                      return BienListTile(
                        bien: bien,
                        action: ()async {
                         // print('go to next page for ${bien.id}');
                          Edl edl = Edl(id_bien: int.parse(bien.id), note: 'none') ;
                         // edl.id_bien= 1;
                        // edl.note = 'none';
                          DatabaseHelper databaseHelper = DatabaseHelper();

                          await databaseHelper.insertEdl(edl).then((id){
                           edl.setEdl(id);
                            print(edl.id_edl);
                            Navigator.push(context, MaterialPageRoute(
                             builder: (context) => PieceTapScreen(),
                            ),);
                          }) ;


                        },
                      );
                    },
                  );
                } else {
                  return
                    Center(child: CircularProgressIndicator());
                }
              }

          )
      ),
    );

  }
}

