import 'package:flutter/material.dart';
import 'package:flutter_netflix_demo/controller/home_controller.dart';
import 'package:get/get.dart';

class SearchMoviePage extends StatefulWidget {
  const SearchMoviePage({Key? key}) : super(key: key);

  @override
  State<SearchMoviePage> createState() => _SearchMoviePageState();
}

class _SearchMoviePageState extends State<SearchMoviePage> {
  HomeController homeController=Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container()
    );
  }
}