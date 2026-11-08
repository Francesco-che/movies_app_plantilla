import 'package:flutter/material.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = 'bc0b3976d679ad7a4a0c502533f27b5e';
  String _language = 'es-ES';
  String _page = '1';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    print('MoviesProvider inicializado');
    this.getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    print('getOnDisplayMovies');
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': _page});

    // Await the http get response, then decode the json-formatted response.
    final result = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(result.body);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/popular',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);

    popularMovies = [...popularMovies, ...popularResponse.results];

    notifyListeners();
  }
}
