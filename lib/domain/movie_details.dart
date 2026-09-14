class MovieDetails {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final String releaseDate;
  final int runtime;
  final double voteAverage;
  final List<String> genres;
  final List<String> cast;
  final String director;
  final String certification;

  const MovieDetails({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.runtime,
    required this.voteAverage,
    required this.genres,
    required this.cast,
    required this.director,
    required this.certification,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    final credits = json['credits'] as Map<String, dynamic>? ?? const {};
    final crew = credits['crew'] as List<dynamic>? ?? const [];
    final castJson = credits['cast'] as List<dynamic>? ?? const [];

    final directors = crew
        .whereType<Map<String, dynamic>>()
        .where((person) => person['job'] == 'Director')
        .map((person) => person['name']?.toString() ?? '')
        .where((name) => name.isNotEmpty)
        .toList();

    return MovieDetails(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title']?.toString() ?? 'Título indisponível',
      overview: json['overview']?.toString() ?? '',
      posterPath: json['poster_path']?.toString(),
      backdropPath: json['backdrop_path']?.toString(),
      releaseDate: json['release_date']?.toString() ?? '',
      runtime: (json['runtime'] as num?)?.toInt() ?? 0,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0,
      genres: (json['genres'] as List<dynamic>? ?? const [])
          .whereType<Map<String, dynamic>>()
          .map((genre) => genre['name']?.toString() ?? '')
          .where((name) => name.isNotEmpty)
          .toList(),
      cast: castJson
          .whereType<Map<String, dynamic>>()
          .take(5)
          .map((person) => person['name']?.toString() ?? '')
          .where((name) => name.isNotEmpty)
          .toList(),
      director: directors.isEmpty ? 'Não informado' : directors.join(', '),
      certification: _brazilianCertification(json),
    );
  }

  static String _brazilianCertification(Map<String, dynamic> json) {
    final releaseDates = json['release_dates'] as Map<String, dynamic>?;
    final countries = releaseDates?['results'] as List<dynamic>? ?? const [];

    for (final country in countries.whereType<Map<String, dynamic>>()) {
      if (country['iso_3166_1'] != 'BR') continue;
      final releases = country['release_dates'] as List<dynamic>? ?? const [];
      for (final release in releases.whereType<Map<String, dynamic>>()) {
        final value = release['certification']?.toString().trim() ?? '';
        if (value.isNotEmpty) return value;
      }
    }
    return 'N/L';
  }

  String get year =>
      releaseDate.length >= 4 ? releaseDate.substring(0, 4) : '—';

  String get formattedRuntime {
    if (runtime <= 0) return '—';
    final hours = runtime ~/ 60;
    final minutes = runtime % 60;
    if (hours == 0) return '${minutes}min';
    return '${hours}h ${minutes.toString().padLeft(2, '0')}min';
  }
}
