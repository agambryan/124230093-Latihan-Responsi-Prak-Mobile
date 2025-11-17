import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/anime_model.dart';

class ApiService {
  static const String baseUrl = 'https://api.jikan.moe/v4';

  Future<List<Anime>> getTopAnime() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/top/anime'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> animeList = data['data'];
        return animeList.map((json) => Anime.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load anime data');
      }
    } catch (e) {
      throw Exception('Error fetching anime: $e');
    }
  }
}