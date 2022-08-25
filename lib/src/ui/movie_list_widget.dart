import 'package:flutter/material.dart';
import 'package:flutter_provider_sample/src/model/movie.dart';
import 'package:flutter_provider_sample/src/provider/movie_provider.dart';
import 'package:provider/provider.dart';

class MovieListWidget extends StatelessWidget {
  MovieListWidget({Key? key}) : super(key: key);
  late MovieProvider _movieProvider;

  @override
  Widget build(BuildContext context) {
    _movieProvider = Provider.of<MovieProvider>(context, listen: false);
    _movieProvider.loadMovies();

    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Provider'),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, provider, child) {
          if (provider.movies.isNotEmpty) {
            return _makeListView(provider.movies);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  _makeMovieOne(Movie movie) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          child: Image.network(movie.postUrl),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  movie.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    movie.overview,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 8,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _makeListView(List<Movie> movies) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(15.0),
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 3,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: _makeMovieOne(movies[index]),
        );
      },
      separatorBuilder: (context, indext) {
        return Divider();
      },
      itemCount: movies.length,
    );
  }
}
