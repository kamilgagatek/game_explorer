import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/game.dart';

class GameApiService {
  static const String baseUrl = "https://www.freetogame.com/api";

  static Future<List<Game>> fetchGames() async {
    final response = await http.get(
      Uri.parse("$baseUrl/games"),
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      return data.map((json) => Game.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load games");
    }
  }

  static Future<Game> fetchGameDetails(int id) async {
    final response = await http.get(
      Uri.parse("$baseUrl/game?id=$id"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return Game.fromJson(data);
    } else {
      throw Exception("Failed to load game details");
    }
  }
}