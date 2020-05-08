class PieceDetail {
  int idPieceDetail;
  int idPiece;
  String designation;
  String nature;
  String etat;
  String couleur;
  String note;
  String photo;


  PieceDetail ({
  this.idPieceDetail,
  this.idPiece,
  this.designation,
  this.nature,
  this.etat,
  this.couleur,
  this.note,
  this.photo
});
  Map<String, dynamic> toJson() {
    return {
      "idPieceDetail": idPieceDetail,
      "idPiece": idPiece,
      "designation": designation,
      "nature": nature,
      "etat": etat,
      "couleur": couleur,
      "note": note,
      "photo": photo,
    };
  }

}
