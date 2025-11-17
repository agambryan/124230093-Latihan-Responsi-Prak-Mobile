class Anime {
  final int malId;
  final String title;
  final String? titleEnglish;
  final String imageUrl;
  final double score;
  final String synopsis;
  final int? episodes;
  final String? status;
  final String? type;
  final int? rank;
  final int? year;
  final List<Genre>? genres;
  final String? url;

  Anime({
    required this.malId,
    required this.title,
    this.titleEnglish,
    required this.imageUrl,
    required this.score,
    required this.synopsis,
    this.episodes,
    this.status,
    this.type,
    this.rank,
    this.year,
    this.genres,
    this.url,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      malId: json['mal_id'] ?? 0,
      title: json['title'] ?? 'Unknown Title',
      titleEnglish: json['title_english'],
      imageUrl:
          json['images']?['jpg']?['large_image_url'] ??
          json['images']?['jpg']?['image_url'] ??
          '',
      score: (json['score'] ?? 0.0).toDouble(),
      synopsis: json['synopsis'] ?? 'No synopsis available',
      episodes: json['episodes'],
      status: json['status'],
      type: json['type'],
      rank: json['rank'],
      year: json['year'],
      genres: json['genres'] != null
          ? (json['genres'] as List).map((g) => Genre.fromJson(g)).toList()
          : null,
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'title': title,
      'title_english': titleEnglish,
      'images': {
        'jpg': {
          'large_image_url': imageUrl,
          'image_url': imageUrl,
        }
      },
      'score': score,
      'synopsis': synopsis,
      'episodes': episodes,
      'status': status,
      'type': type,
      'rank': rank,
      'year': year,
      'genres': genres?.map((g) => g.toJson()).toList(),
      'url': url,
    };
  }
}

class Genre {
  final int malId;
  final String name;

  Genre({required this.malId, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(malId: json['mal_id'] ?? 0, name: json['name'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'name': name,
    };
  }
}