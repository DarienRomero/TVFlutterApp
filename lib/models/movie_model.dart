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
      name: "Justice League: Crisis on Infinite Earths Part Two",
      verticalPhoto: "http://image.tmdb.org/t/p/w500/aOT8n3YOOkInZ5VHJN4FffHrm43.jpg",
      horizontalPhoto: "https://imageio.forbes.com/blogs-images/erikkain/files/2017/11/justice-league.jpg?format=jpg&height=900&width=1600&fit=bounds",
      url : "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
      // url: "http://ns557370.ip-54-39-52.net:8024/server3pelis/espanol/Woody_Woodpecker_Goes_to_Camp_2024.mkv",
    ),
    MovieModel(
      id: 2,
      name: "Un gato con suerte",
      verticalPhoto: "http://image.tmdb.org/t/p/w500/AewKpiZ76mLTnr8dx9skROzMX7P.jpg",
      horizontalPhoto: "https://nerdnews.cl/wp-content/uploads/2024/03/Un-gato-con-suerte-aqui-vamos-de-nuevo-NN_00.jpg",
      url: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
      // url: "http://ns557370.ip-54-39-52.net:8024/server3pelis/espanol/Woody_Woodpecker_Goes_to_Camp_2024.mkv",
    ),
    MovieModel(
      id: 3,
      name: "Loki",
      verticalPhoto: "http://image.tmdb.org/t/p/w300/oJdVHUYrjdS2IqiNztVIP4GPB1p.jpg",
      horizontalPhoto: "https://f.rpp-noticias.io/2021/05/26/1099683lokijpg.jpg",
      url: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
      // url: "http://ns557370.ip-54-39-52.net:8024/server3pelis/espanol/Woody_Woodpecker_Goes_to_Camp_2024.mkv",
    ),
  ];

  static get empty => MovieModel(
    id: 0,
    name: "",
    verticalPhoto: "",
    horizontalPhoto: "",
    url: ""
  );
}

