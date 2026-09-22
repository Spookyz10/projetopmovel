class MovieDetails {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final String releaseDate;
  final int runtime;
  final List<String> genres;
  final List<String> cast;

  const MovieDetails({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.runtime,
    required this.genres,
    required this.cast,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    final image = json['image'] as Map<String, dynamic>?;
    final embedded = json['_embedded'] as Map<String, dynamic>?;
    final castJson = embedded?['cast'] as List<dynamic>? ?? const [];
    return MovieDetails(
      id: (json['id'] as num).toInt(),
      title: json['name'] as String,
      overview: (json['summary'] as String? ?? '')
          .replaceAll(RegExp(r'<[^>]*>'), '')
          .replaceAll('&amp;', '&')
          .replaceAll('&quot;', '"')
          .replaceAll('&#39;', "'")
          .replaceAll('&nbsp;', ' ')
          .replaceAll('&lt;', '<')
          .replaceAll('&gt;', '>')
          .trim(),
      posterPath: image?['medium'] as String?,
      backdropPath: image?['original'] as String?,
      releaseDate: json['premiered'] as String? ?? '',
      runtime:
          ((json['runtime'] ?? json['averageRuntime']) as num?)?.toInt() ?? 0,
      genres: (json['genres'] as List<dynamic>? ?? const []).cast<String>(),
      cast: castJson
          .whereType<Map<String, dynamic>>()
          .map(
            (entry) =>
                (entry['person'] as Map<String, dynamic>?)?['name']
                    as String? ??
                '',
          )
          .where((name) => name.isNotEmpty)
          .take(5)
          .toList(),
    );
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
