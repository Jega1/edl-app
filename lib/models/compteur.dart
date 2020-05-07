import 'dart:convert';


class  Compteur {
  int _id;
  //String _idBien;
  String _type;
  String _numCompt;
  String _hp;
  String _hc;
  String _title;
  String _description;
  String _date;
  int _priority;


  Compteur(this._type, this._numCompt, this._hp, this._hc, this._title, this._date, this._priority, [this._description]);

  Compteur.withId(this._id, this._type, this._numCompt, this._hp, this._hc, this._title, this._date, this._priority, [this._description]);

  int get id => _id;
 // String get idBien => _idBien;
  String get type => _type;
  String get numCompt => _numCompt;
  String get hp => _hp;
  String get hc => _hc;
  String get title => _title;
  String get description => _description;
  String get date => _date;
  int get priority => _priority;

  //set type(String newType){
  //  this._type = newType;

  //}

  set type(String newType){
    if(newType.length <= 255) {
      this._type = newType;
    }
  }
  set numCompt(String newNumCompt){
    if(newNumCompt.length <= 255) {
      this._numCompt = newNumCompt;
    }
  }
  set hp(String newHp){
    if(newHp.length <= 255) {
      this._hp = newHp;
    }
  }
  set hc(String newHc){
    if(newHc.length <= 255) {
      this._hc = newHc;
    }
  }

  set title(String newTitle){
    if(newTitle.length <= 255) {
      this._title = newTitle;
    }
  }

  set description(String newDescription){
    if(newDescription.length <= 255) {
      this._title = newDescription;
    }
  }

  set priority(int newPriority){
    if(newPriority >= 1 && newPriority <= 2) {
      this._priority = newPriority;
    }
  }

  set date(String newDate) {
    this._date = newDate;
  }

//

  Map<String, dynamic>toMap(){
    var map = Map<String, dynamic>();
    if(id != null) {
      map['id'] = _id;
    }
   // map['idBien'] = _idBien;
    map['type'] = _type;
    map['numCompt'] = _numCompt;
    map['hp'] = _hp;
    map['hc'] = _hc;
    map['title'] = _title;
    map['description'] = _description;
    map['priority'] = _priority;
    map['date'] = _date;

    return map;
  }

  // extract a note objet from a map object
  Compteur.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
   // this._idBien = map['idBien'];
    this._type = map['type'];
    this._numCompt = map['numCompt'];
    this._hp = map['hp'];
    this._hc = map['hc'];
    this._title = map['title'];
    this._description = map['description'];
    this._priority = map['priority'];
    this._date = map['date'];

  }

}