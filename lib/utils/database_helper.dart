import 'package:edl/models/edl.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/compteur.dart';



class DatabaseHelper {

  static DatabaseHelper _databaseHelper;    // Singleton DatabaseHelper
  static Database _database;                // Singleton Database

  String compteursTable = 'compteurs_table';
  String colId = 'id';
 // String colIdBien ='idBien';
  String colType = 'type';
  String colNumCompt = 'numCompt';
  String colHp = 'hp';
  String colHc = 'hc';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';



  String edlTable = 'edl_table';
  String colIdEdl  = 'id_edl';
  String colId_bien = 'id_bien';
  String colNote = 'note';


  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {

    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }


  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }



  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'edl.db';

    // Open/create the database at a given path
    var database = await openDatabase(path, version: 1, onCreate: _createDb);
    return database;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $compteursTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colType TEXT,'
        ' $colNumCompt TEXT, $colHp TEXT, $colHc TEXT, $colTitle TEXT, $colDescription TEXT, $colPriority INTEGER, $colDate TEXT)');


    await db.execute('CREATE TABLE $edlTable($colIdEdl INTEGER PRIMARY KEY AUTOINCREMENT, $colId_bien INTEGER, $colNote TEXT)');

  }

  // Insert Operation: Insert a com object to database
  Future<int> insertEdl(Edl edl) async {
    Database db = await this.database;
    var result = await db.insert(edlTable, edl.toJson());
    return result;
  }






  // Fetch Operation: Get all compt objects from database
  Future<List<Map<String, dynamic>>> getCompteurMapList() async {
    Database db = await this.database;

	//var result = await db.rawQuery('SELECT * FROM $compteursTable order by $colPriority ASC');
    var result = await db.query(compteursTable, orderBy: '$colPriority ASC');
    return result;
  }

  // Insert Operation: Insert a com object to database
  Future<int> insertCompteur(Compteur compteur) async {
    Database db = await this.database;
    var result = await db.insert(compteursTable, compteur.toMap());
    return result;
  }

  // Update Operation: Update a comp object and save it to database
  Future<int> updateCompteur(Compteur compteur) async {
    var db = await this.database;
    var result = await db.update(compteursTable, compteur.toMap(), where: '$colId = ?', whereArgs: [compteur.id]);

    return result;
  }

  // Delete Operation: Delete a compteur object from database
  Future<int> deleteCompteur(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $compteursTable WHERE $colId = $id');
    return result;
  }

  // Get number of compteur objects in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $compteursTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'compteur List' [ List<Compteur> ]
  Future<List<Compteur>> getCompteurList() async {
    var compteurMapList = await getCompteurMapList(); // Get 'Map List' from database
    int count = compteurMapList.length;         // Count the number of map entries in db table

    List<Compteur> compteurList = List<Compteur>();
    // For loop to create a 'compteur List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      compteurList.add(Compteur.fromMapObject(compteurMapList[i]));
    }

    return compteurList;
  }





}



