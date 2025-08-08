class Episode {
  final int id;
  final String url;
  final String name;
  final String airDate;
  final String episode;
  final DateTime created;
  final List<String> characters;

  Episode({
    required this.id,
    required this.url,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.created,
    required this.characters,
  });
}