import 'dart:convert';

class OutMovieDetailDto {
  final bool? adult;
  final String? backdropPath;
  final BelongsToCollection? belongsToCollection;
  final int? budget;
  final List<Genre>? genres;
  final String? homepage;
  final int? id;
  final String? imdbId;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompanie>? productionCompanies;
  final List<ProductionCountrie>? productionCountries;
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguage>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  OutMovieDetailDto({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  OutMovieDetailDto copyWith({
    bool? adult,
    String? backdropPath,
    BelongsToCollection? belongsToCollection,
    int? budget,
    List<Genre>? genres,
    String? homepage,
    int? id,
    String? imdbId,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    List<ProductionCompanie>? productionCompanies,
    List<ProductionCountrie>? productionCountries,
    String? releaseDate,
    int? revenue,
    int? runtime,
    List<SpokenLanguage>? spokenLanguages,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) {
    return OutMovieDetailDto(
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      belongsToCollection: belongsToCollection ?? this.belongsToCollection,
      budget: budget ?? this.budget,
      genres: genres ?? this.genres,
      homepage: homepage ?? this.homepage,
      id: id ?? this.id,
      imdbId: imdbId ?? this.imdbId,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      productionCompanies: productionCompanies ?? this.productionCompanies,
      productionCountries: productionCountries ?? this.productionCountries,
      releaseDate: releaseDate ?? this.releaseDate,
      revenue: revenue ?? this.revenue,
      runtime: runtime ?? this.runtime,
      spokenLanguages: spokenLanguages ?? this.spokenLanguages,
      status: status ?? this.status,
      tagline: tagline ?? this.tagline,
      title: title ?? this.title,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adult': adult,
      'backdrop_path': backdropPath,
      'belongs_to_collection': belongsToCollection?.toMap(),
      'budget': budget,
      'genres': genres?.map((x) => x.toMap()).toList(),
      'homepage': homepage,
      'id': id,
      'imdb_id': imdbId,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'production_companies':
          productionCompanies?.map((x) => x.toMap()).toList(),
      'production_countries':
          productionCountries?.map((x) => x.toMap()).toList(),
      'release_date': releaseDate,
      'revenue': revenue,
      'runtime': runtime,
      'spoken_languages': spokenLanguages?.map((x) => x.toMap()).toList(),
      'status': status,
      'tagline': tagline,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  factory OutMovieDetailDto.fromMap(Map<String, dynamic> map) {
    return OutMovieDetailDto(
      adult: map['adult'],
      backdropPath: map['backdrop_path'],
      belongsToCollection: map['belongs_to_collection'] != null
          ? BelongsToCollection.fromMap(map['belongs_to_collection'])
          : null,
      budget: map['budget'].toInt(),
      genres: List<Genre>.from(
        (map['genres'] as List).map<Genre>(
          (x) => Genre.fromMap(x as Map<String, dynamic>),
        ),
      ),
      homepage: map['homepage'],
      id: map['id'].toInt(),
      imdbId: map['imdb_id'],
      originalLanguage: map['original_language'],
      originalTitle: map['original_title'],
      overview: map['overview'],
      popularity: map['popularity'].toDouble(),
      posterPath: map['poster_path'],
      productionCompanies: List<ProductionCompanie>.from(
        (map['production_companies']).map<ProductionCompanie>(
          (x) => ProductionCompanie.fromMap(x as Map<String, dynamic>),
        ),
      ),
      productionCountries: List<ProductionCountrie>.from(
        (map['production_countries']).map<ProductionCountrie>(
          (x) => ProductionCountrie.fromMap(x as Map<String, dynamic>),
        ),
      ),
      releaseDate: map['release_date'],
      revenue: map['revenue'].toInt(),
      runtime: map['runtime'].toInt(),
      spokenLanguages: List<SpokenLanguage>.from(
        (map['spoken_languages']).map<SpokenLanguage>(
          (x) => SpokenLanguage.fromMap(x as Map<String, dynamic>),
        ),
      ),
      status: map['status'],
      tagline: map['tagline'],
      title: map['title'],
      video: map['video'],
      voteAverage: map['vote_average'].toDouble(),
      voteCount: map['vote_count'].toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory OutMovieDetailDto.fromJson(String source) =>
      OutMovieDetailDto.fromMap(json.decode(source) as Map<String, dynamic>);
}

class BelongsToCollection {
  final int? id;
  final String? name;
  final String? posterPath;
  final String? backdropPath;
  BelongsToCollection({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });

  BelongsToCollection copyWith({
    int? id,
    String? name,
    String? posterPath,
    String? backdropPath,
  }) {
    return BelongsToCollection(
      id: id ?? this.id,
      name: name ?? this.name,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
    };
  }

  factory BelongsToCollection.fromMap(Map<String, dynamic> map) {
    return BelongsToCollection(
      id: map['id'].toInt(),
      name: map['name'],
      posterPath: map['poster_path'],
      backdropPath: map['backdrop_path'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BelongsToCollection.fromJson(String source) =>
      BelongsToCollection.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Genre {
  final int? id;
  final String? name;
  Genre({
    this.id,
    this.name,
  });

  Genre copyWith({
    int? id,
    String? name,
  }) {
    return Genre(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Genre.fromMap(Map<String, dynamic> map) {
    return Genre(
      id: map['id'].toInt(),
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Genre.fromJson(String source) =>
      Genre.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ProductionCompanie {
  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;
  ProductionCompanie({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  ProductionCompanie copyWith({
    int? id,
    String? logoPath,
    String? name,
    String? originCountry,
  }) {
    return ProductionCompanie(
      id: id ?? this.id,
      logoPath: logoPath ?? this.logoPath,
      name: name ?? this.name,
      originCountry: originCountry ?? this.originCountry,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'logo_path': logoPath,
      'name': name,
      'origin_country': originCountry,
    };
  }

  factory ProductionCompanie.fromMap(Map<String, dynamic> map) {
    return ProductionCompanie(
      id: map['id'].toInt(),
      logoPath: map['logo_path'],
      name: map['name'],
      originCountry: map['origin_country'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductionCompanie.fromJson(String source) =>
      ProductionCompanie.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ProductionCountrie {
  final String? iso31661;
  final String? name;
  ProductionCountrie({
    this.iso31661,
    this.name,
  });

  ProductionCountrie copyWith({
    String? iso31661,
    String? name,
  }) {
    return ProductionCountrie(
      iso31661: iso31661 ?? this.iso31661,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'iso_3166_1': iso31661,
      'name': name,
    };
  }

  factory ProductionCountrie.fromMap(Map<String, dynamic> map) {
    return ProductionCountrie(
      iso31661: map['iso_3166_1'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductionCountrie.fromJson(String source) =>
      ProductionCountrie.fromMap(json.decode(source) as Map<String, dynamic>);
}

class SpokenLanguage {
  final String? englishName;
  final String? iso6391;
  final String? name;
  SpokenLanguage({
    this.englishName,
    this.iso6391,
    this.name,
  });

  SpokenLanguage copyWith({
    String? englishName,
    String? iso6391,
    String? name,
  }) {
    return SpokenLanguage(
      englishName: englishName ?? this.englishName,
      iso6391: iso6391 ?? this.iso6391,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'english_name': englishName,
      'iso_639_1': iso6391,
      'name': name,
    };
  }

  factory SpokenLanguage.fromMap(Map<String, dynamic> map) {
    return SpokenLanguage(
      englishName: map['english_name'],
      iso6391: map['iso_639_1'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SpokenLanguage.fromJson(String source) =>
      SpokenLanguage.fromMap(json.decode(source) as Map<String, dynamic>);
}
