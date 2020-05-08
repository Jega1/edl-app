import '../models/piece.dart';
import 'package:http/http.dart' show Client;

class ApiService {
  final String baseUrl = "http://api.bengkelrobot.net:8001";
  Client client = Client();

  Future<List<Piece>> getPieces() async {
    final response = await client.get("$baseUrl/api/piece");
    if (response.statusCode == 200) {
     // return pieceFromJson(response.body);
    } else {
      return null;
    }
  }


  Future<bool> createPiece(Piece data) async {
    print(data);

    final response = await client.post(
      "$baseUrl/api/piece",
      headers: {"content-type": "application/json"},
    //  body: pieceToJson(data),
    );
    if (response.statusCode == 201) {
      print(response);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updatePiece(Piece data) async {
    final response = await client.put(
      "$baseUrl/api/piece/${data.idPiece}",
      headers: {"content-type": "application/json"},
    //  body: pieceToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deletePiece(int idPiece) async {
    final response = await client.delete(
      "$baseUrl/api/piece/$idPiece",
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
