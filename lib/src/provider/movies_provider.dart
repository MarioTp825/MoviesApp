
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/src/helpers/debouncer.dart';
import 'package:movies_app/src/models/models.dart';

class MoviesProvider extends ChangeNotifier{
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = 'd9fdb61c97c0365ba02f273372cd8179';
  final String _lang = 'en-US';
  final StreamController<List<Results>?> _suggestionsController = StreamController.broadcast();
  Stream<List<Results>?> get suggestionsStream => _suggestionsController.stream;
  final debouncer = Debouncer(
    duration: const Duration(milliseconds: 500),
  );


  var playingNow = <Results>[];
  var popular = <Results>[];
  var popularPage = 0;
  var castPage = 0;

  var cast = <int, List<Cast>>{};

  MoviesProvider() {
    getNowPlayingMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String parameter, {int page = 1, String query = ''}) async {
    var url = Uri.https(
        _baseUrl,
        '/3/$parameter',
        {
          'api_key': _apiKey,
          'language': _lang,
          'page': page.toString(),
          if(query.isNotEmpty)
            'query': query
        });
    final response = await http.get(url);
    return response.body;
  }

  getNowPlayingMovies() async {
    final response = await _getJsonData('movie/now_playing');
    final nowPlaying = nowPlayingResponseFromJson(response);
    if(nowPlaying.results == null) return;

    playingNow = nowPlaying.results!;
    notifyListeners();

  }

  getPopularMovies() async {
    final response = await _getJsonData('movie/popular', page: ++popularPage);
    final popular = nowPlayingResponseFromJson(response);
    if(popular.results == null) return;

    this.popular = [...this.popular ,...popular.results!];
    notifyListeners();
  }

  Future<List<Cast>?> getActors(int id) async {
    if(this.cast.containsKey(id)) return this.cast[id];
    final response = await _getJsonData('movie/$id/credits', page: ++castPage);
    final cast = creditsResponseFromJson(response);
    if(cast.cast == null) return null;
    this.cast[id] = cast.cast!;
    return cast.cast!;

  }

  Future<List<Results>?> _searchMovie(String query) async {
    final response = await _getJsonData('search/movie', query: query);
    final search = searchResponseFromJson(response);
    return search.results;
  }

  void getSuggestionsByQuery(String query) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final res = await _searchMovie(query);
      _suggestionsController.add(res);
    };

    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debouncer.value = query;
    });

    Future.delayed(const Duration(milliseconds: 301)).then((value) => timer.cancel());
  }
}