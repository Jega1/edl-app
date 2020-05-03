import 'dart:convert';

class Piece {
  int idPiece;
  String typePiece;

  Piece({this.idPiece = 0, this.typePiece});

  factory Piece.fromJson(Map<String, dynamic> map) {
    return Piece(
      idPiece: map["idPiece"],
      typePiece: map["typePiece"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"idPiece": idPiece, "typePiece": typePiece};
  }

  @override
  String toString() {
    return 'Piece{idPiece: $idPiece, typePiece: $typePiece}';
  }
}

List<Piece> pieceFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Piece>.from(data.map((item) => Piece.fromJson(item)));
}

String pieceToJson(Piece data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
