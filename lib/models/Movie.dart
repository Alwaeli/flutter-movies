class Movie {
  final String title;
  final String year;
  final String poster;
  final String imdbID;

  Movie({this.title, this.year, this.poster, this.imdbID});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json['Title'],
        year: json['Year'],
        poster: json['Poster'],
        imdbID: json['imdbID']
       );
  }
}