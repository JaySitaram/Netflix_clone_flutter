import 'package:flutter/material.dart';
import 'package:flutter_netflix_demo/utils/shared_pref_service.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefs.init();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
        debugShowCheckedModeBanner: false,
         title: 'Flutter Demo',
         theme: ThemeData.dark(),
         initialRoute: '/Splash',
         getPages: getPages,
       );
      }
    );
  }
}