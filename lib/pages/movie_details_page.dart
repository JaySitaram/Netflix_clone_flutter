import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_netflix_demo/controller/home_controller.dart';
import 'package:sizer/sizer.dart';

import '../repository/movie_repository.dart';
import '../utils/colors.dart';
import 'package:get/get.dart';
import '../widgets/button_widget.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({Key? key}) : super(key: key);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  HomeController homeController = Get.put(HomeController());
  var data = Get.arguments;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.callVideoApi(data.id);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: homeController,
        builder: (context) {
          return Scaffold(
            backgroundColor: AppColors.blackColor,
            body: CustomScrollView(slivers: [
              SliverAppBar(
                expandedHeight: 70.w,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: new BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Image.network(
                        UrlConstants.imgUrl + data.posterPath,
                        fit: BoxFit.cover,
                        colorBlendMode: BlendMode.colorDodge,
                      )),
                ),
              ),
              SliverList(delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(data.title,style: TextStyle(
                          fontSize: 22
                        ),),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      Text(data.overview,style: TextStyle(
                        fontSize: 16
                      ),),
                      SizedBox(
                        height: 5.w,
                      ),
                      Text('Popularity -> ${data.popularity.toString()}'),
                  SizedBox(
                        height: 2.w,
                      ),
                      Text('Vote Average -> ${data.voteAverage.toString()}'),
                      SizedBox(
                        height: 2.w,
                      ),
                      Text('Vote Count -> ${data.voteCount.toString()}'),
                      SizedBox(
                        height: 5.w,
                      ),
                      Text("Videos",style: TextStyle(
                        fontSize: 20
                      ),),
                      homeController.videoModel.value.results!=null?ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return  ListTile(
                            onTap: (){
                              Get.toNamed('/Video',arguments: homeController.videoModel.value.results![index].id);
                            },
                            leading: Container(
                              width: 10.w,
                              height: 10.w,
                              color: Colors.blue,
                            ),
                              title:
                                Text(homeController
                                    .videoModel.value.results![index].name!),
                                subtitle:Text(homeController
                                    .videoModel.value.results![index].site!),
                               
                            )
                          ;
                        },
                        itemCount:
                            homeController.videoModel.value.results!.length,
                      ):Container(),
                    ],
                  ),
                );
              },childCount: 1))
            ]),
          );
        });
  }
}
