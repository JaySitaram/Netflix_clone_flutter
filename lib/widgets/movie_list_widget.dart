import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../repository/movie_repository.dart';
import '../utils/colors.dart';

class MovieListWidget extends StatelessWidget {
  String? title;
  List? list;
  Function(dynamic)? function;
  MovieListWidget({Key? key,this.title,this.list,this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
    
            Text(title!,style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(
                    height: 2.w,
                  ),
                  list!=null?Container(
                    height: 40.w,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: () => function!(list![index]),
                          child: Container(
                                width: 35.w,
                                height: 80.w,
                                padding: EdgeInsets.all(7),
                            margin: EdgeInsets.only(right: 20),
                            // color: Colors.red,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                               
                                image: NetworkImage(UrlConstants.imgUrl+list![index].backdropPath!),
                              )
                            ),
                            child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(list![index].title,maxLines: 4,
                                    style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize: 15
                                    ),
                                    )),
                          ),
                        );
                      },
                      itemCount:  list!.length,
                    ),
                  ):Container(),
                   SizedBox(
                    height: 5.w,
                  ),
        ],
      );
  }
}