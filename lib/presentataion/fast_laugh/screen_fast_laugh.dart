import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/fastlaugh/fastlaugh_bloc.dart';
import 'package:netflix_app/presentataion/fast_laugh/widget/video_list_item.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<FastlaughBloc>(context).add(Initialize());
    });
    return Scaffold(
      //state maarunanathin anusarich ath rebuild aakanaum so nammal aa safe area wrap akum
      body: SafeArea(
        //namml ivde page view ahnu use aakunnath,oru pagil oru sadhanam,athin vendi ,like tiktok in vendi nammal use cheyunnnapole oru widget undakit ond pubspec il add akit ond video_player ena name
          child: BlocBuilder<FastlaughBloc, FastlaughState>(
            builder: (context, state) {
              if(state.isLoading){
return Center(child: CircularProgressIndicator(strokeWidth: 2,));
              }else if(state.iserror){
return Center(child: Text('Error While Getting Data'));
              }else if(state.videosList.isEmpty){
return Center(child: Text('Video List Empty'));
                    }else{
                return PageView(
                  scrollDirection: Axis.vertical,
                  children:
                  List.generate(state.videosList.length, (index)
                  {
                    return VideoListItemInheritWidget(
                        widget:VideoListItem(
                          key: Key(index.toString()),
//key use aaknunath multiple aaya widget use chythal ath tirich ariyan vendii
                      index: index,), moviedata: state.videosList[index]);
                  }),


                );
              }
              }
          )
      ),
    );
  }
}
