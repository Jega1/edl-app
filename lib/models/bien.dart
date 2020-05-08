
import 'dart:convert';

List<Bien> bienFromJson(String str) => List<Bien>.from(json.decode(str).map((x) => Bien.fromJson(x)));

String bienToJson(List<Bien> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Bien {
  String id;
  String idCopropriete;
  String idImmeuble;
  String nom;
  String description;
  String type;
  String etage;
  String porte;
  String piece;
  String surface;
  String lots;
  String tantieme;
  String adresse;
  String complement;
  String codepostal;
  String ville;


  Bien({
    this.id,
    this.idCopropriete,
    this.idImmeuble,
    this.nom,
    this.description,
    this.type,
    this.etage,
    this.porte,
    this.piece,
    this.surface,
    this.lots,
    this.tantieme,
    this.adresse,
    this.complement,
    this.codepostal,
    this.ville,

  });

  factory Bien.fromJson(Map<String, dynamic> json) => Bien(
    id: json["id"],
    idCopropriete: json["idCopropriete"],
    idImmeuble: json["idImmeuble"],
    nom: json["nom"],
    description: json["description"],
    type: json["type"],
    etage: json["etage"],
    porte: json["porte"],
    piece: json["piece"],
    surface: json["surface"],
    lots: json["lots"],
    tantieme: json["tantieme"],
    adresse: json["adresse"],
    complement: json["complement"],
    codepostal: json["codepostal"],
    ville: json["ville"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "idCopropriete": idCopropriete,
    "idImmeuble": idImmeuble,
    "nom": nom,
    "description": description,
    "type": type,
    "etage": etage,
    "porte": porte,
    "piece": piece,
    "surface": surface,
    "lots": lots,
    "tantieme": tantieme,
    "adresse": adresse,
    "complement": complement,
    "codepostal": codepostal,
    "ville": ville,

  };

}




