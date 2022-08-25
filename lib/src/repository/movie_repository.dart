import 'dart:convert';

import 'package:flutter_provider_sample/src/model/movie.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  Map<String, String> queryParam = {
    "api_key" : "085227c4897de39892643cad8d5cbcf3"
  };

  Future<List<Movie>> loadMovies() async {
    Uri uri = Uri.https("api.themoviedb.org", "/3/movie/popular", queryParam);
    http.Response response = await http.get(uri);

    if(response.body != null) {
      Map<String, dynamic> body = json.decode(response.body);
      if(body["results"] != null) {
        List<dynamic> list = body["results"];
        return list.map<Movie>((item) => Movie.fromJson(item)).toList();
      }
    }

    return [];
  }
}
