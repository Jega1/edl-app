class Edl {
  int id_edl;
  int id_bien;
  //int idBail;
  //String typeEdl;
  // dateEdl;
 // String signatureAge;
  //String signatureLocat
  String note;

 Edl({
   this.id_edl,
   this.id_bien,
  // this.idBail,
   //this typeEdl;
   // this.dateEdl;
   // this.signatureAge;
   //this.signatureLocat
   this.note,
});


  Map<String, dynamic> toJson() =>
      {
        "id_edl": id_edl,
        "id_bien": id_bien,
       // "idBail": idBail,
        //"typeEdl": typeEdl,
        // "dateEdl": dateEdl,
        // "signatureAge": signatureAge,
        //"signatureLocat": signatureLocat,
        "note": note
      };

   setEdl(int newIdEdl){
    this.id_edl = newIdEdl;
  }



}

