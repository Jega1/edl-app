
class Edl {
  int id_edl;
  int id_bien;
  String note;

 Edl({
   this. id_edl,
   this. id_bien,
   this. note,
});


  Map<String, dynamic> toJson() =>
      {
        "id_edl": id_edl,
        "id_bien": id_bien,
        "note": note

      };

   setEdl(int newIdEdl){
    this.id_edl = newIdEdl;
  }



}

