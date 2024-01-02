import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:netflix_app/domain/downloads/i_downloads_repo.dart';
import '../../domain/downloads/models/downloads.dart';
import '../search/search_bloc.dart';
part 'fastlaugh_event.dart';
part 'fastlaugh_state.dart';
part 'fastlaugh_bloc.freezed.dart';
final dummyVideoUrls=[
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4"
];
ValueNotifier<Set<int>>likedVideosNotifier=ValueNotifier({});
@injectable
class FastlaughBloc extends Bloc<FastlaughEvent, FastlaughState> {
  FastlaughBloc(IDownloadsRepo _downloadsService,
      //i downloads repo vere oru page il ahnu ath namuk ivde kittan anagne vendi ahnu nammal injectaable use aaknunnath
      ) : super(FastlaughState.initial()) {
    on<Initialize>((event, emit) async {
      //namk ui il loading kanikan vendi
      emit(FastlaughState(
          videosList: [],
          isLoading: true,
          iserror: false,) );
      //get trending movies
      final _result = await _downloadsService
          .getDownloadsImages(); //namalk kanan pattum getdownloadsimage il namk ela trending movies kittum
      final _state = _result.fold((l) {
        return FastlaughState(
            videosList: [],
            isLoading: false,
            iserror: true,
            );
      }, (resp) =>
          FastlaughState(
              videosList: resp,
              isLoading: false,
              iserror: false,)
              );
      //send to ui

      emit(_state);
    });


// nammal paranja liked and unliked videos inte event avide kodukanam

on<LikedVideo>((event, emit)async {
likedVideosNotifier.value.add(event.id);
likedVideosNotifier.notifyListeners();
    });
    on<UnlikedVideo>((event, emit)async {
      likedVideosNotifier.value.remove(event.id);
      likedVideosNotifier.notifyListeners();
    });

  }
}