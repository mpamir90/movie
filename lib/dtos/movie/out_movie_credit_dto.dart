import 'dart:convert';

class OutMovieCreditDto {
  final int? id;
  final List<Cast>? cast;
  final List<Crew>? crew;
  OutMovieCreditDto({
    this.id,
    this.cast,
    this.crew,
  });

  OutMovieCreditDto copyWith({
    int? id,
    List<Cast>? cast,
    List<Crew>? crew,
  }) {
    return OutMovieCreditDto(
      id: id ?? this.id,
      cast: cast ?? this.cast,
      crew: crew ?? this.crew,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cast': cast?.map((x) => x.toMap()).toList(),
      'crew': crew?.map((x) => x.toMap()).toList(),
    };
  }

  factory OutMovieCreditDto.fromMap(Map<String, dynamic> map) {
    return OutMovieCreditDto(
      id: map['id'].toInt(),
      cast: List<Cast>.from(
        (map['cast']).map<Cast>(
          (x) => Cast.fromMap(x as Map<String, dynamic>),
        ),
      ),
      crew: List<Crew>.from(
        (map['crew']).map<Crew>(
          (x) => Crew.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory OutMovieCreditDto.fromJson(String source) =>
      OutMovieCreditDto.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Cast {
  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final int? castId;
  final String? character;
  final String? creditId;
  final int? order;
  Cast({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });

  Cast copyWith({
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
    int? order,
  }) {
    return Cast(
      adult: adult ?? this.adult,
      gender: gender ?? this.gender,
      id: id ?? this.id,
      knownForDepartment: knownForDepartment ?? this.knownForDepartment,
      name: name ?? this.name,
      originalName: originalName ?? this.originalName,
      popularity: popularity ?? this.popularity,
      profilePath: profilePath ?? this.profilePath,
      castId: castId ?? this.castId,
      character: character ?? this.character,
      creditId: creditId ?? this.creditId,
      order: order ?? this.order,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adult': adult,
      'gender': gender,
      'id': id,
      'known_for_department': knownForDepartment,
      'name': name,
      'original_name': originalName,
      'popularity': popularity,
      'profile_path': profilePath,
      'cast_id': castId,
      'character': character,
      'credit_id': creditId,
      'order': order,
    };
  }

  factory Cast.fromMap(Map<String, dynamic> map) {
    return Cast(
      adult: map['adult'],
      gender: map['gender'].toInt(),
      id: map['id'].toInt(),
      knownForDepartment: map['known_for_department'],
      name: map['name'],
      originalName: map['original_name'],
      popularity: map['popularity'].toDouble(),
      profilePath: map['profile_path'],
      castId: map['cast_id'].toInt(),
      character: map['character'],
      creditId: map['credit_id'],
      order: map['order'].toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cast.fromJson(String source) =>
      Cast.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cast(adult: $adult, gender: $gender, id: $id, known_for_department: $knownForDepartment, name: $name, original_name: $originalName, popularity: $popularity, profile_path: $profilePath, cast_id: $castId, character: $character, credit_id: $creditId, order: $order)';
  }
}

class Crew {
  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final String? creditId;
  final String? department;
  final String? job;
  Crew({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.creditId,
    this.department,
    this.job,
  });

  Crew copyWith({
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
    String? job,
  }) {
    return Crew(
      adult: adult ?? this.adult,
      gender: gender ?? this.gender,
      id: id ?? this.id,
      knownForDepartment: knownForDepartment ?? this.knownForDepartment,
      name: name ?? this.name,
      originalName: originalName ?? this.originalName,
      popularity: popularity ?? this.popularity,
      profilePath: profilePath ?? this.profilePath,
      creditId: creditId ?? this.creditId,
      department: department ?? this.department,
      job: job ?? this.job,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adult': adult,
      'gender': gender,
      'id': id,
      'known_for_department': knownForDepartment,
      'name': name,
      'original_name': originalName,
      'popularity': popularity,
      'profile_path': profilePath,
      'credit_id': creditId,
      'department': department,
      'job': job,
    };
  }

  factory Crew.fromMap(Map<String, dynamic> map) {
    return Crew(
      adult: map['adult'],
      gender: map['gender'].toInt(),
      id: map['id'].toInt(),
      knownForDepartment: map['known_for_department'],
      name: map['name'],
      originalName: map['original_name'],
      popularity: map['popularity'].toDouble(),
      profilePath: map['profile_path'],
      creditId: map['credit_id'],
      department: map['department'],
      job: map['job'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Crew.fromJson(String source) =>
      Crew.fromMap(json.decode(source) as Map<String, dynamic>);
}
