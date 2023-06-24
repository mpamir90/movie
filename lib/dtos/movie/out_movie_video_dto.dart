import 'dart:convert';

class OutMovieVideoDto {
  final int? id;
  final List<Result>? results;
  OutMovieVideoDto({
    this.id,
    this.results,
  });

  OutMovieVideoDto copyWith({
    int? id,
    List<Result>? results,
  }) {
    return OutMovieVideoDto(
      id: id ?? this.id,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'results': results?.map((x) => x.toMap()).toList(),
    };
  }

  factory OutMovieVideoDto.fromMap(Map<String, dynamic> map) {
    return OutMovieVideoDto(
      id: map['id'].toInt(),
      results: List<Result>.from(
        (map['results']).map<Result>(
          (x) => Result.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory OutMovieVideoDto.fromJson(String source) =>
      OutMovieVideoDto.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Result {
  final String? iso6391;
  final String? iso31661;
  final String? name;
  final String? key;
  final String? site;
  final int? size;
  final String? type;
  final bool? official;
  final String? publishedAt;
  final String? id;
  Result({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  Result copyWith({
    String? iso6391,
    String? iso31661,
    String? name,
    String? key,
    String? site,
    int? size,
    String? type,
    bool? official,
    String? publishedAt,
    String? id,
  }) {
    return Result(
      iso6391: iso6391 ?? this.iso6391,
      iso31661: iso31661 ?? this.iso31661,
      name: name ?? this.name,
      key: key ?? this.key,
      site: site ?? this.site,
      size: size ?? this.size,
      type: type ?? this.type,
      official: official ?? this.official,
      publishedAt: publishedAt ?? this.publishedAt,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'iso_639_1': iso6391,
      'iso_3166_1': iso31661,
      'name': name,
      'key': key,
      'site': site,
      'size': size,
      'type': type,
      'official': official,
      'published_at': publishedAt,
      'id': id,
    };
  }

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      iso6391: map['iso_639_1'],
      iso31661: map['iso_3166_1'],
      name: map['name'],
      key: map['key'],
      site: map['site'],
      size: map['size'].toInt(),
      type: map['type'],
      official: map['official'],
      publishedAt: map['published_at'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Result.fromJson(String source) =>
      Result.fromMap(json.decode(source) as Map<String, dynamic>);
}
