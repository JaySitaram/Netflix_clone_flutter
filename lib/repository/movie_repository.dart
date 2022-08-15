import 'package:flutter_netflix_demo/repository/common_repository.dart';

import '../model/latest_movie_model.dart';
import '../model/popular_movie_model.dart';
import '../model/top_rated_movie_model.dart';
import '../model/upcoming_movie_model.dart';
import '../model/video_model.dart';

class MovieRepository{ 
  generateTokenUrl(String url) async{
     var response=await ApiRepository().getApi(url);
     return response['request_token'];
  }

  sessionLogin(String url,Map<String,String>? map) async{
    var response=await ApiRepository().postApi(url, map);
    print(response);
  }

  latestMovies(String url) async{
    var response=await ApiRepository().getApi(url);
    return LatestMovie.fromJson(response);
  }

  upcomingMovies(String url) async{
    var response=await ApiRepository().getApi(url);
    return UpcomingMovie.fromJson(response);
  }
 
  popularMovies(String url) async{
    var response=await ApiRepository().getApi(url);
    return PopularMovie.fromJson(response);
  }

  topRatedMovieUrl(String url) async{
    var response=await ApiRepository().getApi(url);
    return TopRatedMovie.fromJson(response);
  }

  videosUrl(String url,int id,String url2) async{
    print(url+id.toString()+url2);
    var response=await ApiRepository().getApi(url+id.toString()+url2);
    return Video.fromJson(response);
  }

}

class UrlConstants{
  static String baseUrl='https://api.themoviedb.org/3/';
  static String imgUrl='https://image.tmdb.org/t/p/w300';
  static String queryParameter='?api_key=76397255b9375d56d9317144eab98eb0';
  static String authUrl=baseUrl+'authentication/token/new'+queryParameter;
  static String loginAuthUrl=baseUrl+'authentication/token/validate_with_login'+queryParameter;
  static String latestMovieUrl=baseUrl+'movie/latest'+queryParameter;
  static String popularMovieUrl=baseUrl+'movie/popular'+queryParameter;
  static String topRatedMovieUrl=baseUrl+'movie/top_rated'+queryParameter;
  static String upcomnigMovieUrl=baseUrl+'movie/upcoming'+queryParameter;
  static String videos1Url=baseUrl+'movie/';
  static String videos2Url='/videos'+queryParameter;
}