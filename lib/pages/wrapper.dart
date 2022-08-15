import 'package:flutter/material.dart';
import 'package:flutter_netflix_demo/assets.dart';
import 'package:flutter_netflix_demo/utils/colors.dart';
import 'package:sizer/sizer.dart';


class WrapperElement extends StatelessWidget {
  Widget? widget;
  GlobalKey? globalKey;
  GlobalKey? formKey;
  WrapperElement({Key? key,this.widget,this.globalKey,this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      key: globalKey,
      appBar: AppBar(
        elevation: 0,
        leading: Container(),
        title: Image.asset(Assets.netflixImagePNG,width: 20.w,height: 20.w,),
        backgroundColor: AppColors.blackColor,
      ),
      backgroundColor: AppColors.blackColor,
      body: Form(
        key: formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: widget,
        ),
      ),
     );
  }
}