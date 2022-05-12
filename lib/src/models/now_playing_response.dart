import 'dart:convert';

NowPlayingResponse nowPlayingResponseFromJson(String str) =>
    NowPlayingResponse.fromJson(json.decode(str));

String nowPlayingResponseToJson(NowPlayingResponse data) =>
    json.encode(data.toJson());

class NowPlayingResponse {
  NowPlayingResponse({
    Dates? dates,
    int? page,
    List<Results>? results,
    int? totalPages,
    int? totalResults,}) {
    _dates = dates;
    _page = page;
    _results = results;
    _totalPages = totalPages;
    _totalResults = totalResults;
  }

  NowPlayingResponse.fromJson(dynamic json) {
    _dates = json['dates'] != null ? Dates.fromJson(json['dates']) : null;
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

  Dates? _dates;
  int? _page;
  List<Results>? _results;
  int? _totalPages;
  int? _totalResults;

  NowPlayingResponse copyWith({ Dates? dates,
    int? page,
    List<Results>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      NowPlayingResponse(
        dates: dates ?? _dates,
        page: page ?? _page,
        results: results ?? _results,
        totalPages: totalPages ?? _totalPages,
        totalResults: totalResults ?? _totalResults,
      );

  Dates? get dates => _dates;

  int? get page => _page;

  List<Results>? get results => _results;

  int? get totalPages => _totalPages;

  int? get totalResults => _totalResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_dates != null) {
      map['dates'] = _dates?.toJson();
    }
    map['page'] = _page;
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = _totalPages;
    map['total_results'] = _totalResults;
    return map;
  }

}

Results resultsFromJson(String str) => Results.fromJson(json.decode(str));

String resultsToJson(Results data) => json.encode(data.toJson());

class Results {
  Results({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,}) {
    _adult = adult;
    _backdropPath = backdropPath;
    _genreIds = genreIds;
    _id = id;
    _originalLanguage = originalLanguage;
    _originalTitle = originalTitle;
    _overview = overview;
    _popularity = popularity;
    _posterPath = posterPath;
    _releaseDate = releaseDate;
    _title = title;
    _video = video;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
  }

  Results.fromJson(dynamic json) {
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    _genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    _id = json['id'];
    _originalLanguage = json['original_language'];
    _originalTitle = json['original_title'];
    _overview = json['overview'];
    _popularity = json['popularity'];
    _posterPath = json['poster_path'];
    _releaseDate = json['release_date'];
    _title = json['title'];
    _video = json['video'];
    _voteAverage = double.tryParse(json['vote_average'].toString()) ;
    _voteCount = json['vote_count'];
  }

  bool? _adult;
  String? _backdropPath;
  List<int>? _genreIds;
  int? _id;
  String? _originalLanguage;
  String? _originalTitle;
  String? _overview;
  double? _popularity;
  String? _posterPath;
  String? _releaseDate;
  String? _title;
  bool? _video;
  double? _voteAverage;
  int? _voteCount;

  get fullPath {
    return _posterPath == null? "http://via.placeholder.com/300x400" : "https://image.tmdb.org/t/p/w500$_posterPath";
  }

  get backgroundPath {
    return _posterPath == null? "http://via.placeholder.com/300x400" : "https://image.tmdb.org/t/p/w500$_backdropPath";
  }

  Results copyWith({ bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) =>
      Results(
        adult: adult ?? _adult,
        backdropPath: backdropPath ?? _backdropPath,
        genreIds: genreIds ?? _genreIds,
        id: id ?? _id,
        originalLanguage: originalLanguage ?? _originalLanguage,
        originalTitle: originalTitle ?? _originalTitle,
        overview: overview ?? _overview,
        popularity: popularity ?? _popularity,
        posterPath: posterPath ?? _posterPath,
        releaseDate: releaseDate ?? _releaseDate,
        title: title ?? _title,
        video: video ?? _video,
        voteAverage: voteAverage ?? _voteAverage,
        voteCount: voteCount ?? _voteCount,
      );

  String? heroId;

  bool? get adult => _adult;

  String? get backdropPath => _backdropPath;

  List<int>? get genreIds => _genreIds;

  int? get id => _id;

  String get originalLanguage => _originalLanguage ?? "N/A";

  String get originalTitle => _originalTitle ?? "N/A";

  String get overview => _overview ?? "N/A";

  double get popularity => _popularity ?? 0.0;

  String get posterPath => _posterPath ?? "N/A";

  String? get releaseDate => _releaseDate;

  String get title => _title ?? "N/A";

  bool? get video => _video;

  double get voteAverage => _voteAverage ?? 0.0;

  int? get voteCount => _voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = _adult;
    map['backdrop_path'] = _backdropPath;
    map['genre_ids'] = _genreIds;
    map['id'] = _id;
    map['original_language'] = _originalLanguage;
    map['original_title'] = _originalTitle;
    map['overview'] = _overview;
    map['popularity'] = _popularity;
    map['poster_path'] = _posterPath;
    map['release_date'] = _releaseDate;
    map['title'] = _title;
    map['video'] = _video;
    map['vote_average'] = _voteAverage;
    map['vote_count'] = _voteCount;
    return map;
  }

}

Dates datesFromJson(String str) => Dates.fromJson(json.decode(str));

String datesToJson(Dates data) => json.encode(data.toJson());

class Dates {
  Dates({
    String? maximum,
    String? minimum,}) {
    _maximum = maximum;
    _minimum = minimum;
  }

  Dates.fromJson(dynamic json) {
    _maximum = json['maximum'];
    _minimum = json['minimum'];
  }

  String? _maximum;
  String? _minimum;

  Dates copyWith({ String? maximum,
    String? minimum,
  }) =>
      Dates(maximum: maximum ?? _maximum,
        minimum: minimum ?? _minimum,
      );

  String? get maximum => _maximum;

  String? get minimum => _minimum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['maximum'] = _maximum;
    map['minimum'] = _minimum;
    return map;
  }

}