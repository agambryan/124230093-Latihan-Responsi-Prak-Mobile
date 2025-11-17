import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/anime_model.dart';

class FavoritesService {
  static const String favoritesKey = 'favorite_anime';

  Future<List<Anime>> getFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favoritesJson = prefs.getStringList(favoritesKey) ?? [];

      return favoritesJson
          .map((json) => Anime.fromJson(jsonDecode(json)))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> addFavorite(Anime anime) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favorites = await getFavorites();

      if (!favorites.any((a) => a.malId == anime.malId)) {
        favorites.add(anime);
        final favoritesJson = favorites
            .map((anime) => jsonEncode(anime.toJson()))
            .toList();
        await prefs.setStringList(favoritesKey, favoritesJson);
      }
    } catch (e) {
      // Handle error
    }
  }

  Future<void> removeFavorite(int malId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favorites = await getFavorites();

      favorites.removeWhere((anime) => anime.malId == malId);

      final favoritesJson = favorites
          .map((anime) => jsonEncode(anime.toJson()))
          .toList();
      await prefs.setStringList(favoritesKey, favoritesJson);
    } catch (e) {
      // Handle error
    }
  }

  Future<bool> isFavorite(int malId) async {
    final favorites = await getFavorites();
    return favorites.any((anime) => anime.malId == malId);
  }

  Future<bool> toggleFavorite(Anime anime) async {
    final isFav = await isFavorite(anime.malId);

    if (isFav) {
      await removeFavorite(anime.malId);
      return false;
    } else {
      await addFavorite(anime);
      return true;
    }
  }
}