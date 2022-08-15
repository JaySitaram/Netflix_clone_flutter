import 'package:flutter/material.dart';
import 'package:flutter_netflix_demo/controller/home_controller.dart';
import 'package:flutter_netflix_demo/utils/colors.dart';
import 'package:flutter_netflix_demo/widgets/button_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../repository/movie_repository.dart';
import '../widgets/movie_list_widget.dart';

class MovieListScreen extends StatefulWidget {
  HomeController? controller;
  MovieListScreen({Key? key,this.controller}) : super(key: key);

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {

  @override
  void initState() {
    // TODO: implement initState
    
    widget.controller!.getApis();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
init:  widget.controller,
      builder: (context) {
        return Scaffold(
          backgroundColor:AppColors.blackColor,
          body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 90.w,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Column(
                 mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Major',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight:FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 2.w,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.check,color: AppColors.whiteColor,size: 20,),
                            Text("My List",style: TextStyle(
                                color: AppColors.whiteColor,fontSize: 10
                              ),),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: AppColors.whiteColor,
                          height: 7.w,
                          child: GestureDetector(
                            onTap: (){},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                              Icon(Icons.play_arrow,color: AppColors.blackColor,size: 20,),
                              Text("Play",style: TextStyle(
                                color: AppColors.blackColor,fontSize: 15
                              ),)
                            ]),
                          ),
                        ),
                      ),
                      Expanded(child:Column(
                        children: [
                          Icon(Icons.info,color: AppColors.whiteColor,size: 20,),
                          Text("Info",style: TextStyle(
                                color: AppColors.whiteColor,fontSize: 10
                              ),),
                        ],
                      )),
                    ],
                  ),
                ],
              ),
              background: Image.network(
                'https://cdn.99images.com/photos/movies-tv/major/major-movie-latest-hd-photos-posters-wallpapers-download-1080p-lavd.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return  Container(
                  margin: EdgeInsets.only(top: 30,bottom: 10),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
              MovieListWidget(
                function: (value){
                  Get.toNamed('/MovieDetails',arguments: value);
                },
                title: "Popular Movies on Netflix",
                list: widget.controller!.popularMovies.value.results
              ),
              
                MovieListWidget(
                    function: (value){
                  Get.toNamed('/MovieDetails',arguments: value);
                },
                title: "Top Rated Movies on Netflix",
                list: widget.controller!.popularMovies.value.results
              ),
              MovieListWidget(
                  function: (value){
                  Get.toNamed('/MovieDetails',arguments: value);
                },
                title: "Upcoming Netflix Movies",
                list: widget.controller!.upcomingMovies.value.results
              ),
              ],
            ),
          );
              },
              childCount: 1
            ),
          ),
          
         
        ]));
      }
    );
  }
}