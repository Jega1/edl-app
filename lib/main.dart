
import 'package:edl/screens/piece/pieces_list.dart';


import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'translations.dart';
import './screens/login_screen.dart';
import './screens/type_edl_screen.dart';

import 'screens/tab_bien/tabs_bien_screen.dart';


void main(){
  runApp(new MyApp());
}


class MyApp extends StatelessWidget {
  get bien => null;


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Application',
      theme: new ThemeData(
        primarySwatch: Colors.pink,
      ),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('fr', ''),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: LoginScreen(),
      routes: {
          '/type-edl': (ctx) => TypeEdlScreen(),
       // '/bien-list-screen': (ctx) => BienListScreen(),
       // '/bien-detail-screen': (ctx) => BienDetailsScreen(),
        '/tabs-bien-screen': (ctx) => TabsBienScreen(bien: bien),
        //   '/note-screen': (ctx) => CompteurList(),

       '/pieces-list': (ctx) => PieceList(),
       // '/pieces-screen': (ctx) => PieceScreen(),

      },

      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => LoginScreen(),
        );
      },

      //initialRoute: '/',
      //onGenerateRoute: Router.generateRoute,
    );
  }
}

