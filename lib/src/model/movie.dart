class Movie {
  //"title": "Dragon Ball Super: Super Hero",
  //"poster_path": "/rugyJdeoJm7cSJL1q4jBpTNbxyU.jpg",
  //"overview": "The Red Ribbon Army, an evil organization that was once destroyed by Goku in the past, has been reformed by a group of people who have created new and mightier Androids, Gamma 1 and Gamma 2, and seek vengeance against Goku and his family.",
  String overview;
  String posterPath;
  String title;

  Movie(
      {required this.overview, required this.posterPath, required this.title});

  //팩토리 패턴 - json -> obj
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      overview: json["overview"] as String,
      posterPath: json["poster_path"] as String,
      title: json["title"] as String,
    );
  }

  String get postUrl => "https://image.tmdb.org/t/p/w500${posterPath}";
}
