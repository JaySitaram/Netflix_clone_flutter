import 'package:flutter_netflix_demo/pages/splash_screen.dart';
import 'package:get/get.dart';

import '../pages/home_screen.dart';
import '../pages/login_screen.dart';
import '../pages/movie_details_page.dart';
import '../pages/sign_up_screen.dart';
import '../pages/youtube_player_screen.dart';
import 'bindings.dart';

var getPages=[
  GetPage(name: '/Splash', page: ()=>SplashScreen()),
  GetPage(name: '/Login', page: ()=>LoginScreen()),
  GetPage(name: '/Home', page: ()=>HomeScreen(),binding: HomeBindings()),
  GetPage(name: '/SignUp', page: ()=>SignUpScreen()),
  GetPage(name: '/MovieDetails', page: ()=>MovieDetailsPage()),
  GetPage(name: '/Video',page: ()=>YoutubePlayerScreen())
];