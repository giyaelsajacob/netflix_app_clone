import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/fastlaugh/fastlaugh_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/colors/constants.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';
import 'package:video_player/video_player.dart';
import 'package:share_plus/share_plus.dart';
class VideoListItemInheritWidget extends InheritedWidget {
  final Widget widget;
  final Downloads moviedata;
  VideoListItemInheritWidget({
    Key? key,
    required this.widget,
    required this.moviedata}) : super(key:key,child:widget);
  //create a constructor

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return (oldWidget as VideoListItemInheritWidget).moviedata != moviedata;
  }


  static VideoListItemInheritWidget? of(BuildContext context)
  {
    return context.dependOnInheritedWidgetOfExactType<VideoListItemInheritWidget>();
  }

}
class VideoListItem extends StatelessWidget {
  final int index; // mate fast and laugh inte insex ivde kodukam apo namlk differnt differnt colour k kodukam
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final posterPath=VideoListItemInheritWidget.of(context)?.moviedata.posterPath;
    final videoUrl=dummyVideoUrls[index%dummyVideoUrls.length];
    return Stack(
      children: [
       FastLaughVideoPlayer(videoUrl: videoUrl, onStateChanged: (bool){}),
        Align(
          alignment: Alignment.bottomCenter,
          //ith use cheyunnath poitioned anel
          // left: 0,
          // right: 0,
          // bottom: 0,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                //left side

                CircleAvatar(
                radius: 30,
                backgroundColor: Colors.black.withOpacity(0.5),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.volume_off,color: kWhiteColor,size: 30,)),
              ),

              //right side
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
              children: [
              CircleAvatar(
               radius:30,
                backgroundImage:posterPath==null?null:NetworkImage('$imageAppendUrl$posterPath') ,
              ),
                kheight20,
                ValueListenableBuilder(
                    valueListenable:likedVideosNotifier,
                    builder: (BuildContext c,Set<int>newLikedListIds,Widget?_){
    final _index=index;
    if(newLikedListIds.contains(_index)){
      return GestureDetector(
        onTap: (){
//BlocProvider.of<FastlaughBloc>(context).add(UnlikedVideo(id: _index));
          likedVideosNotifier.value.remove(_index);
          likedVideosNotifier.notifyListeners();
        },
        child:VideoActionsWidget(
            icon: Icons.favorite_outline,
            title:"Liked"),
      );
    }
    return GestureDetector(
      onTap: (){
       // BlocProvider.of<FastlaughBloc>(context).add(LikedVideo(id: _index));

        likedVideosNotifier.value.add(_index);
        likedVideosNotifier.notifyListeners();
      },
      child: VideoActionsWidget(
          icon: Icons.emoji_emotions,
          title:"LOL"),
    );
  },
),
                kheight20,
                VideoActionsWidget(icon: Icons.add, title:"My List"),
                kheight20,
                GestureDetector(
                    onTap: (){
                      log('Share Clicked');
                      final movieName=VideoListItemInheritWidget.of(context)?.moviedata.posterPath;
                     log(movieName.toString());
                      if(movieName!=null){
                        Share.share(movieName);
                      }

                    },
                    child: VideoActionsWidget(icon: Icons.share, title:"share")),
                kheight20,
                VideoActionsWidget(icon: Icons.play_arrow, title:"Play")
          ],
        )

      ],
    ),)
    ,
    )
    ]
    ,
    );
  }
}
class  VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionsWidget ({super.key, required this.icon, required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon,color: Colors.white,size: 30,),
        Text(title,style: TextStyle(color: kWhiteColor,fontSize: 16),),
      ],
    );
  }
}

//videok vendi

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;
  const FastLaughVideoPlayer({super.key, required this.videoUrl, required this.onStateChanged});

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
//videoplayer inte controller
//late use cheyam future il initialize chytha mati
late VideoPlayerController _videoPlayerController;
@override
  void initState() {
    _videoPlayerController=VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value)
    {
      setState(() {
_videoPlayerController.play();
      });
    }
    );
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized?
          AspectRatio(aspectRatio: _videoPlayerController.value.aspectRatio,child: VideoPlayer(_videoPlayerController),)
      :Center(child: CircularProgressIndicator(strokeWidth: 2,))
    );
  }
  @override
  void dispose() {
   _videoPlayerController.dispose();
    super.dispose();
  }
}
