import 'package:flutter/material.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {

  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = 'bc0b3976d679ad7a4a0c502533f27b5e';
  String _language = 'es-ES';
  String _page = '1';

  MoviesProvider(){
    print('MoviesProvider inicializado');
    this.gatOnDisplayMovies();
  }

  gatOnDisplayMovies() async {
    print('getOnDisplayMovies');
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey, 
      'language': _language, 
      'page': _page
      });

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['results'];
      print('Number of books about http: $itemCount.');
      
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
  
}