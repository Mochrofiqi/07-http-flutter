import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http_request_07/models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500';

  const MovieDetail({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String path;

    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path =
          'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                height: height / 1.5,
                child: Image.network(path),

                color: Colors.black
              ),
              Card(
                color: Colors.brown[300],
                child: Column(
                  children: [
                    Container(
                        child: Text(movie.title,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold, backgroundColor: Colors.white)),
                        padding: const EdgeInsets.only(top: 10)),
                    Container(
                        child: Text('Rating = ${movie.voteAverage.toString()}',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold,  backgroundColor: Colors.white)),
                        padding: const EdgeInsets.only(top: 5, bottom: 15)),
                    Container(
                      child:
                          Text(movie.overview, style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold)),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                    ),
                    SizedBox(height: 30,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
