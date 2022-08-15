import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../controller/home_controller.dart';
import '../utils/colors.dart';
import 'movie_list_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PersistentTabController _controller=PersistentTabController();
  HomeController homeController=Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: AppColors.blackColor, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style2, // Choose the nav bar style with this property.
    ), 
    );    
  }

  _buildScreens(){
    return [
      MovieListScreen(
        controller: homeController,
      ),
      MovieListScreen(
        controller: homeController,
      ),
      MovieListScreen(
        controller: homeController,
      ),
      MovieListScreen(
        controller: homeController,
      ),
    ];
  }
  
  _navBarsItems() {
    return [
      PersistentBottomNavBarItem(icon: Icon(Icons.home),title: "Home"),
      PersistentBottomNavBarItem(icon: Icon(Icons.search),title: "Search"),
      PersistentBottomNavBarItem(icon: Icon(Icons.favorite),title: "Favorite"),
      PersistentBottomNavBarItem(icon: Icon(Icons.download),title: "Download"),
    ];
  } 
}