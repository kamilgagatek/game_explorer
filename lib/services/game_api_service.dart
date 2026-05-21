import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/game.dart';

class GameApiService {
  static const String baseUrl = "https://www.freetogame.com/api";

  static Future<List<Game>> fetchGames() async {

    try {

      final response = await http.get(
        Uri.parse("$baseUrl/games"),
      );

      if (response.statusCode == 200) {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString("cached_games", response.body);
        final List data = jsonDecode(response.body);
        return data.map((json) => Game.fromJson(json)).toList();
      } else {
        throw Exception("Błąd API");
      }

    } catch (e) {
      final prefs = await SharedPreferences.getInstance();
      final cachedData = prefs.getString("cached_games");
      if (cachedData != null) {
        final List data = jsonDecode(cachedData);
        return data.map((json) => Game.fromJson(json)).toList();
      }
      throw Exception("Brak internetu oraz brak zapisanych lokalnie danych");
    }
  }


static Future<Game> fetchGameDetails(int id) async {
  try {
    final response = await http.get(
      Uri.parse("$baseUrl/game?id=$id"),
    );

    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("game_$id", response.body);

      final data = jsonDecode(response.body);
      return Game.fromJson(data);
    } else {
      throw Exception("API error");
    }
  } catch (e) {
    final prefs = await SharedPreferences.getInstance();
    final cachedData = prefs.getString("game_$id");
    if (cachedData != null) {
      final data = jsonDecode(cachedData);
      return Game.fromJson(data);
    }
    throw Exception("Brak internetu i/lub zapisanych danych");
  }
}
}