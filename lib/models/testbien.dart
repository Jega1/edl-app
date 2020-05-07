import 'dart:convert';


class  Testbien {
  String _idTest;
  String _idBien;
  String _name;



  Testbien(this._idBien, this._name);

  Testbien.withId(this._idTest, this._idBien, this._name);

  String get idTest => _idTest;
  String get idBien => _idBien;
  String get name => _name;


  set idBien(String newIdBien){
         this._idBien = newIdBien;
      }
  set name(String newName){
      this._name = newName;
  }




  Map<String, dynamic>toMap(){
    var map = Map<String, dynamic>();
    if(idTest != null) {
      map['idTest'] = _idTest;
    }
     map['idBien'] = _idBien;
    map['name'] = _name;

    return map;
  }

  // extract a compt objet from a map object
  Testbien.fromMapObject(Map<String, dynamic> map) {
    this._idTest = map['idTest'];
     this._idBien = map['idBien'];
    this._name = map['name'];

  }

}