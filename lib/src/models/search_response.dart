import 'dart:convert';

import 'now_playing_response.dart';
SearchResponse searchResponseFromJson(String str) => SearchResponse.fromJson(json.decode(str));
String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());
class SearchResponse {
  SearchResponse({
      int? page, 
      List<Results>? results, 
      int? totalPages, 
      int? totalResults,}){
    _page = page;
    _results = results;
    _totalPages = totalPages;
    _totalResults = totalResults;
}

  SearchResponse.fromJson(dynamic json) {
    _page = json['page'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Results.fromJson(v));
      });
    }
    _totalPages = json['total_pages'];
    _totalResults = json['total_results'];
  }
  int? _page;
  List<Results>? _results;
  int? _totalPages;
  int? _totalResults;
SearchResponse copyWith({  int? page,
  List<Results>? results,
  int? totalPages,
  int? totalResults,
}) => SearchResponse(  page: page ?? _page,
  results: results ?? _results,
  totalPages: totalPages ?? _totalPages,
  totalResults: totalResults ?? _totalResults,
);
  int? get page => _page;
  List<Results>? get results => _results;
  int? get totalPages => _totalPages;
  int? get totalResults => _totalResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = _totalPages;
    map['total_results'] = _totalResults;
    return map;
  }

}
