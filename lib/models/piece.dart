import 'dart:convert';

class Piece {
  int idPiece;
  int id_edl;
  String typePiece;

  Piece({
    this.idPiece,
    this.id_edl,
    this.typePiece
  });

  factory Piece.fromJson(Map<String, dynamic> map) {
    return Piece(
      idPiece: map["idPiece"],
      id_edl: map["id_edl"],
      typePiece: map["typePiece"],
    );
  }

                    //toMap
  Map<String, dynamic> toJson() {
    return {
      "idPiece": idPiece,
      "id_edl": id_edl,
      "typePiece": typePiece};
  }

  setPiece(int newIdPiece) {
    this.idPiece = newIdPiece;
  }


}




   //   @override
  //    String toString() {
  //      return 'Piece{idPiece: $idPiece, typePiece: $typePiece}';
 //     }
  //  }

  //  List<Piece> pieceFromJson(String jsonData) {
   //   final data = json.decode(jsonData);
   //   return List<Piece>.from(data.map((item) => Piece.fromJson(item)));
   // }

  //  String pieceToJson(Piece data) {
   //   final jsonData = data.toJson();
   //   return json.encode(jsonData);
   // }
