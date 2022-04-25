import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_request_07/models/movie.dart';

class HttpService {
  final String apiKey = "220d3d12f5a4541359df49903499ca37";
  final String  baseUrl = "https://api.themoviedb.org/3/movie/popular?api_key=";


 Future<dynamic> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print('Success');
      final jsonResponse = jsonDecode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print('Failure');
      return '';
    }
  }
}