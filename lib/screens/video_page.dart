import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:odtv_final_ui/my_network.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  bool play = false;
  void initVideo() async {
    MyNetwork.currentChanel.playBackUrl = await MyNetwork().getPlayBack();
    print(MyNetwork.currentChanel.playBackUrl);
    videoPlayerController = VideoPlayerController.network(
      MyNetwork.currentChanel.playBackUrl,
      formatHint: VideoFormat.hls,
    );
    await videoPlayerController.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
    );
    play = true;
    setState(() {});
  }

  @override
  void initState() {
    play = false;
    initVideo();
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: play
          ? Chewie(
              controller: chewieController,
            )
          : CircularProgressIndicator(),
    );
  }
}
