import 'package:flutter/material.dart';
import 'package:flutter_provider_sample/src/model/movie.dart';
import 'package:flutter_provider_sample/src/repository/movie_repository.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> _movies = [];

  List<Movie> get movies => _movies;

  MovieRepository _movieRepository = MovieRepository();

  loadMovies() async {
    List<Movie> listMovies = await _movieRepository.loadMovies();
    // 예외 처리 및
    // 추가 가공 절차 필요할 수도
    _movies = listMovies;
    notifyListeners();
  }

}
