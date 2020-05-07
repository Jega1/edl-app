import '../models/bien.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "";
  Client client = Client();

  Future<List<Bien>> getBiens() async {
    final response =
    await client.get("$baseUrl/");
    if (response.statusCode == 200) {
      return bienFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<Bien> getBienById() async {
    final response =
    await client
        .get("$baseUrl");

    if (response.statusCode == 200) {
      return Bien.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load bien');
    }
  }




}
