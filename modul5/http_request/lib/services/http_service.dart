import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class HttpService {
  final String apiKey = '233c48ae52a78e9201193c2d8d4c4adc';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<List<Movie>?> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));

    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'] as List;
      List<Movie> movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("Gagal mengambil data");
      return null;
    }
  }
}
