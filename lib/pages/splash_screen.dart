import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_netflix_demo/utils/shared_pref_service.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../assets.dart';
import '../utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    if(SharedPrefs.getBoolValue('isLogin')!=null && SharedPrefs.getBoolValue('isLogin')){
      Timer(Duration(seconds: 2),()=> Get.toNamed('/Home'));
    }else{
      Timer(Duration(seconds: 2),()=> Get.toNamed('/SignUp'));
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Center(child: Image.asset(Assets.netflixImagePNG,width: 40.w,height: 40.w)),
    );
  }
}