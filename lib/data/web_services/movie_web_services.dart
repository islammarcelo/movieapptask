import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class MoviesWebServices {


  Future<dynamic> getAllMovies() async {
    String url = 'https://api.themoviedb.org/3/movie/popular?api_key=631b53c2d55c71c205704a35b2793f8f&language=en-US';
    http.Response res = await http.get(Uri.parse(url));

    if(res.statusCode == 200){
      String data = res.body;
      if(kDebugMode){
        log('response: $data');

      }
      var jsonData= jsonDecode(data);
      return jsonData;
    }else{
      print("statusCode= ${res.statusCode}");
    }
  }

  Future<dynamic> getMovieDetails(int movieId) async {
    String url = 'https://api.themoviedb.org/3/movie/${movieId}?api_key=631b53c2d55c71c205704a35b2793f8f&language=en-US';
    http.Response res = await http.get(Uri.parse(url));

    if(res.statusCode == 200){
      String data = res.body;
      if(kDebugMode){
        log('response: $data');
      }
      var jsonData= jsonDecode(data);
      return jsonData;
    }else{
      print("statusCode= ${res.statusCode}");
    }
  }
}