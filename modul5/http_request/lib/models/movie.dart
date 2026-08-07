class Movie {
  int? id;
  String? title;
  double? voteAverage;
  String? overview;
  String? posterPath;

  Movie(this.id, this.title, this.voteAverage, this.overview, this.posterPath);

  // Mengubah JSON menjadi Objek Movie
  Movie.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    title = parsedJson['title'];
    voteAverage = parsedJson['vote_average'] * 1.0; // Pastikan jadi double
    overview = parsedJson['overview'];
    posterPath = parsedJson['poster_path'];
  }
}
