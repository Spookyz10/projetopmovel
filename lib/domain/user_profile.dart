class UserReview {
  final String movieTitle;
  final double rating;
  final String comment;

  const UserReview({
    required this.movieTitle,
    required this.rating,
    required this.comment,
  });

  factory UserReview.fromJson(Map<String, dynamic> json) {
    return UserReview(
      movieTitle: json['movieTitle']?.toString() ?? 'Filme',
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      comment: json['comment']?.toString() ?? '',
    );
  }
}

class UserProfile {
  final int id;
  final String name;
  final String username;
  final String avatarUrl;
  final String bio;
  final String memberSince;
  final int watchedMovies;
  final int favoritesCount;
  final int reviewsCount;
  final List<String> favoriteGenres;
  final List<UserReview> recentReviews;

  const UserProfile({
    required this.id,
    required this.name,
    required this.username,
    required this.avatarUrl,
    required this.bio,
    required this.memberSince,
    required this.watchedMovies,
    required this.favoritesCount,
    required this.reviewsCount,
    required this.favoriteGenres,
    required this.recentReviews,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name']?.toString() ?? 'Usuário',
      username: json['username']?.toString() ?? '',
      avatarUrl: json['avatarUrl']?.toString() ?? '',
      bio: json['bio']?.toString() ?? '',
      memberSince: json['memberSince']?.toString() ?? '',
      watchedMovies: (json['watchedMovies'] as num?)?.toInt() ?? 0,
      favoritesCount: (json['favoritesCount'] as num?)?.toInt() ?? 0,
      reviewsCount: (json['reviewsCount'] as num?)?.toInt() ?? 0,
      favoriteGenres: (json['favoriteGenres'] as List<dynamic>? ?? const [])
          .map((genre) => genre.toString())
          .toList(),
      recentReviews: (json['recentReviews'] as List<dynamic>? ?? const [])
          .whereType<Map<String, dynamic>>()
          .map(UserReview.fromJson)
          .toList(),
    );
  }
}
