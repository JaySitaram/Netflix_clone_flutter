import 'package:flutter_netflix_demo/model/latest_movie_model.dart';
import 'package:flutter_netflix_demo/model/popular_movie_model.dart';
import 'package:flutter_netflix_demo/model/top_rated_movie_model.dart';
import 'package:flutter_netflix_demo/model/upcoming_movie_model.dart';
import 'package:flutter_netflix_demo/repository/movie_repository.dart';
import 'package:get/get.dart';

import '../model/video_model.dart';

class HomeController extends GetxController{
  final latestMovies=LatestMovie().obs;
  final upcomingMovies=UpcomingMovie().obs;
  final topRatedMovies=TopRatedMovie().obs;
  final popularMovies=PopularMovie().obs;
  final videoModel=Video().obs;

  getApis() async{
    latestMovies.value=await MovieRepository().latestMovies(UrlConstants.latestMovieUrl);
    print(latestMovies.value);
    print('called');
    popularMovies.value=await MovieRepository().popularMovies(UrlConstants.popularMovieUrl);
    topRatedMovies.value=await MovieRepository().topRatedMovieUrl(UrlConstants.topRatedMovieUrl);
    upcomingMovies.value=await MovieRepository().upcomingMovies(UrlConstants.upcomnigMovieUrl);
    update();
  }

  void callVideoApi(int id) async{
    videoModel.value=await MovieRepository().videosUrl(UrlConstants.videos1Url, id, UrlConstants.videos2Url);
    update();
  }
}