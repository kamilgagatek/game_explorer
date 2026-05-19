class Game {
  final int id;
  final String title;
  final String thumbnail;
  final String shortDescription;
  final String gameUrl;
  final String genre;
  final String publisher;
  final String developer;
  final String releaseDate;
  final String freeToGameProfileUrl;

  Game({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.shortDescription,
    required this.gameUrl,
    required this.genre,
    required this.publisher,
    required this.developer,
    required this.releaseDate,
    required this.freeToGameProfileUrl,
  });

  factory Game.fromJson(Map<String, dynamic> map) {
    return Game(
      id: map["id"],
      title: map["title"],
      thumbnail: map["thumbnail"],
      shortDescription: map["short_description"],
      gameUrl: map["game_url"],
      genre: map["genre"],
      publisher: map["publisher"],
      developer: map["developer"],
      releaseDate: map["release_date"],
      freeToGameProfileUrl: map["freetogame_profile_url"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "thumbnail": thumbnail,
      "short_description": shortDescription,
      "game_url": gameUrl,
      "genre": genre,
      "publisher": publisher,
      "developer": developer,
      "release_date": releaseDate,
      "freetogame_profile_url": freeToGameProfileUrl,
    };
  }
}