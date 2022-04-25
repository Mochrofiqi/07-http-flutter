import 'package:flutter/material.dart';
import 'package:http_request_07/service/http_service.dart';
import 'package:http_request_07/pages/movie_detail.dart';

class MovieList extends StatefulWidget {

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int? moviesCount;
  List movies = [];
  HttpService? service;

  Future initialize() async {
    movies = [];
    movies = await service!.getPopularMovies();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }
 @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies - Moch. Rofiqi'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: (moviesCount == null) ? 0 : moviesCount,
          itemBuilder: (context, position) {
            return GestureDetector(
              onTap: () {
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (context) => MovieDetail(
                    movie: movies[position],
                  ),
                );
                Navigator.push(context, route);
              },
              child: Card(
                color: Colors.brown[100],
                elevation: 2.0,
                child: ListTile(
                  leading: Image.network(
                    'https://image.tmdb.org/t/p/w500${movies[position].posterPath}',
                  ),
                  title: Text(movies[position].title),
                  subtitle: Text(
                    'Rating = ${movies[position].voteAverage.toString()}',
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}