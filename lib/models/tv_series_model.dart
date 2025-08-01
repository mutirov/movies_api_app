class TVSeriesModel {
  final int id;
  final String name;
  final String overview;
  final String posterPath;

  TVSeriesModel({
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
  });

  factory TVSeriesModel.fromJson(Map<String, dynamic> json) {
    return TVSeriesModel(
      id: json['id'],
      name: json['name'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'overview': overview,
      'poster_path': posterPath,
    };
  }
}

