/// adult : false
/// backdrop_path : "/fCayJrkfRaCRCTh8GqN30f8oyQF.jpg"
/// belongs_to_collection : null
/// budget : 63000000
/// genres : [{"id":18,"name":"Drama"}]
/// homepage : ""
/// id : 550
/// imdb_id : "tt0137523"
/// original_language : "en"
/// original_title : "Fight Club"
/// overview : "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion."
/// popularity : 0.5
/// poster_path : null
/// production_companies : [{"id":508,"logo_path":"/7PzJdsLGlR7oW4J0J5Xcd0pHGRg.png","name":"Regency Enterprises","origin_country":"US"},{"id":711,"logo_path":null,"name":"Fox 2000 Pictures","origin_country":""},{"id":20555,"logo_path":null,"name":"Taurus Film","origin_country":""},{"id":54050,"logo_path":null,"name":"Linson Films","origin_country":""},{"id":54051,"logo_path":null,"name":"Atman Entertainment","origin_country":""},{"id":54052,"logo_path":null,"name":"Knickerbocker Films","origin_country":""},{"id":25,"logo_path":"/qZCc1lty5FzX30aOCVRBLzaVmcp.png","name":"20th Century Fox","origin_country":"US"}]
/// production_countries : [{"iso_3166_1":"US","name":"United States of America"}]
/// release_date : "1999-10-12"
/// revenue : 100853753
/// runtime : 139
/// spoken_languages : [{"iso_639_1":"en","name":"English"}]
/// status : "Released"
/// tagline : "How much can you know about yourself if you've never been in a fight?"
/// title : "Fight Club"
/// video : false
/// vote_average : 7.8
/// vote_count : 3439

class MovieDetails{

  late bool adult;
  late String backdropPath;
  late dynamic belongsToCollection;
  late int budget;
  late List<Genres> genres;
  late String homepage;
  late int id;
  late String imdbId;
  late String originalLanguage;
  late String originalTitle;
  late String overview;
  late double popularity;
  late dynamic posterPath;

  late String releaseDate;
  late int revenue;
  late int runtime;
  late List<SpokenLanguages> spokenLanguages;
  late String status;
  late String tagline;
  late String title;
  late bool video;
  late double voteAverage;
  late int voteCount;


  MovieDetails();

  MovieDetails.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'];
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres.add(Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];


    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        spokenLanguages.add(SpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }


}

/// iso_639_1 : "en"
/// name : "English"

class SpokenLanguages {

  late String iso6391;
  late String name;

  SpokenLanguages.fromJson(dynamic json) {
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }





}



/// id : 18
/// name : "Drama"

class Genres {

  late int id;
  late String name;

  Genres.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

}