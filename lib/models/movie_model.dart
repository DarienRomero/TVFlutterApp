class MovieModel {
  final int id;
  final String name;
  final String verticalPhoto;
  final String horizontalPhoto;
  final String url;

  MovieModel({
    required this.id,
    required this.name,
    required this.verticalPhoto,
    required this.horizontalPhoto,
    required this.url,
  });

  static List<MovieModel> get exampleList => [
    MovieModel(
      id: 1,
      name: "",
      verticalPhoto: "",
      horizontalPhoto: "",
      url: "",
    ),
    MovieModel(
      id: 2,
      name: "",
      verticalPhoto: "",
      horizontalPhoto: "",
      url: "",
    ),
    MovieModel(
      id: 3,
      name: "",
      verticalPhoto: "",
      horizontalPhoto: "",
      url: "",
    ),
    MovieModel(
      id: 4,
      name: "",
      verticalPhoto: "",
      horizontalPhoto: "",
      url: "",
    ),
  ];
}

