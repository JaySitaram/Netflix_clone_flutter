import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubePlayerScreen extends StatefulWidget {
  const YoutubePlayerScreen({Key? key}) : super(key: key);

  @override
  State<YoutubePlayerScreen> createState() => _YoutubePlayerScreenState();
}

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> {
  bool? autoPlay;

var _controller;
var id=Get.arguments;

@override
  void initState() {
    // TODO: implement initState
    
    _controller = YoutubePlayerController()..onInit = (){
   
};
_controller.loadVideoById(videoId: id,startSeconds: 30.0);
super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      controller: _controller,
      builder: (context, player) {
        return Scaffold(
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (kIsWeb && constraints.maxWidth > 750) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: player),
                  ],
                );
              }

              return ListView(
                children: [
                  player,
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}