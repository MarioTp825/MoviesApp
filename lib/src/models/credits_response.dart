import 'dart:convert';
CreditsResponse creditsResponseFromJson(String str) => CreditsResponse.fromJson(json.decode(str));
String creditsResponseToJson(CreditsResponse data) => json.encode(data.toJson());
class CreditsResponse {
  CreditsResponse({
      int? id, 
      List<Cast>? cast, 
      List<Crew>? crew,}){
    _id = id;
    _cast = cast;
    _crew = crew;
}

  CreditsResponse.fromJson(dynamic json) {
    _id = json['id'];
    if (json['cast'] != null) {
      _cast = [];
      json['cast'].forEach((v) {
        _cast?.add(Cast.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      _crew = [];
      json['crew'].forEach((v) {
        _crew?.add(Crew.fromJson(v));
      });
    }
  }
  int? _id;
  List<Cast>? _cast;
  List<Crew>? _crew;
CreditsResponse copyWith({  int? id,
  List<Cast>? cast,
  List<Crew>? crew,
}) => CreditsResponse(  id: id ?? _id,
  cast: cast ?? _cast,
  crew: crew ?? _crew,
);
  int? get id => _id;
  List<Cast>? get cast => _cast;
  List<Crew>? get crew => _crew;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_cast != null) {
      map['cast'] = _cast?.map((v) => v.toJson()).toList();
    }
    if (_crew != null) {
      map['crew'] = _crew?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Crew crewFromJson(String str) => Crew.fromJson(json.decode(str));
String crewToJson(Crew data) => json.encode(data.toJson());
class Crew {
  Crew({
      bool? adult, 
      int? gender, 
      int? id, 
      String? knownForDepartment, 
      String? name, 
      String? originalName, 
      double? popularity, 
      String? profilePath, 
      String? creditId, 
      String? department, 
      String? job,}){
    _adult = adult;
    _gender = gender;
    _id = id;
    _knownForDepartment = knownForDepartment;
    _name = name;
    _originalName = originalName;
    _popularity = popularity;
    _profilePath = profilePath;
    _creditId = creditId;
    _department = department;
    _job = job;
}

  Crew.fromJson(dynamic json) {
    _adult = json['adult'];
    _gender = json['gender'];
    _id = json['id'];
    _knownForDepartment = json['known_for_department'];
    _name = json['name'];
    _originalName = json['original_name'];
    _popularity = json['popularity'];
    _profilePath = json['profile_path'];
    _creditId = json['credit_id'];
    _department = json['department'];
    _job = json['job'];
  }
  bool? _adult;
  int? _gender;
  int? _id;
  String? _knownForDepartment;
  String? _name;
  String? _originalName;
  double? _popularity;
  String? _profilePath;
  String? _creditId;
  String? _department;
  String? _job;
Crew copyWith({  bool? adult,
  int? gender,
  int? id,
  String? knownForDepartment,
  String? name,
  String? originalName,
  double? popularity,
  String? profilePath,
  String? creditId,
  String? department,
  String? job,
}) => Crew(  adult: adult ?? _adult,
  gender: gender ?? _gender,
  id: id ?? _id,
  knownForDepartment: knownForDepartment ?? _knownForDepartment,
  name: name ?? _name,
  originalName: originalName ?? _originalName,
  popularity: popularity ?? _popularity,
  profilePath: profilePath ?? _profilePath,
  creditId: creditId ?? _creditId,
  department: department ?? _department,
  job: job ?? _job,
);
  bool? get adult => _adult;
  int? get gender => _gender;
  int? get id => _id;
  String? get knownForDepartment => _knownForDepartment;
  String? get name => _name;
  String? get originalName => _originalName;
  double? get popularity => _popularity;
  String? get profilePath => _profilePath;
  String? get creditId => _creditId;
  String? get department => _department;
  String? get job => _job;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = _adult;
    map['gender'] = _gender;
    map['id'] = _id;
    map['known_for_department'] = _knownForDepartment;
    map['name'] = _name;
    map['original_name'] = _originalName;
    map['popularity'] = _popularity;
    map['profile_path'] = _profilePath;
    map['credit_id'] = _creditId;
    map['department'] = _department;
    map['job'] = _job;
    return map;
  }

}

Cast castFromJson(String str) => Cast.fromJson(json.decode(str));
String castToJson(Cast data) => json.encode(data.toJson());
class Cast {
  Cast({
      bool? adult, 
      int? gender, 
      int? id, 
      String? knownForDepartment, 
      String? name, 
      String? originalName, 
      double? popularity, 
      String? profilePath, 
      int? castId, 
      String? character, 
      String? creditId, 
      int? order,}){
    _adult = adult;
    _gender = gender;
    _id = id;
    _knownForDepartment = knownForDepartment;
    _name = name;
    _originalName = originalName;
    _popularity = popularity;
    _profilePath = profilePath;
    _castId = castId;
    _character = character;
    _creditId = creditId;
    _order = order;
}

  Cast.fromJson(dynamic json) {
    _adult = json['adult'];
    _gender = json['gender'];
    _id = json['id'];
    _knownForDepartment = json['known_for_department'];
    _name = json['name'];
    _originalName = json['original_name'];
    _popularity = json['popularity'];
    _profilePath = json['profile_path'];
    _castId = json['cast_id'];
    _character = json['character'];
    _creditId = json['credit_id'];
    _order = json['order'];
  }
  bool? _adult;
  int? _gender;
  int? _id;
  String? _knownForDepartment;
  String? _name;
  String? _originalName;
  double? _popularity;
  String? _profilePath;
  int? _castId;
  String? _character;
  String? _creditId;
  int? _order;
Cast copyWith({  bool? adult,
  int? gender,
  int? id,
  String? knownForDepartment,
  String? name,
  String? originalName,
  double? popularity,
  String? profilePath,
  int? castId,
  String? character,
  String? creditId,
  int? order,
}) => Cast(  adult: adult ?? _adult,
  gender: gender ?? _gender,
  id: id ?? _id,
  knownForDepartment: knownForDepartment ?? _knownForDepartment,
  name: name ?? _name,
  originalName: originalName ?? _originalName,
  popularity: popularity ?? _popularity,
  profilePath: profilePath ?? _profilePath,
  castId: castId ?? _castId,
  character: character ?? _character,
  creditId: creditId ?? _creditId,
  order: order ?? _order,
);
  bool? get adult => _adult;
  int? get gender => _gender;
  int? get id => _id;
  String? get knownForDepartment => _knownForDepartment;
  String get name => _name ?? "N/A";
  String? get originalName => _originalName;
  double? get popularity => _popularity;
  String get profilePath => _profilePath == null ? 'https://via.placeholder.com/150x300' : 'https://image.tmdb.org/t/p/w500$_profilePath';
  int? get castId => _castId;
  String? get character => _character;
  String? get creditId => _creditId;
  int? get order => _order;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = _adult;
    map['gender'] = _gender;
    map['id'] = _id;
    map['known_for_department'] = _knownForDepartment;
    map['name'] = _name;
    map['original_name'] = _originalName;
    map['popularity'] = _popularity;
    map['profile_path'] = _profilePath;
    map['cast_id'] = _castId;
    map['character'] = _character;
    map['credit_id'] = _creditId;
    map['order'] = _order;
    return map;
  }

}