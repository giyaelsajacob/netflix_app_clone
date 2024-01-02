import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';
import '../../domain/new_and_hot/model/new_and_hot.dart';
import '../../domain/new_and_hot/new_and_hot_service.dart';
part 'home_bloc.freezed.dart';

part 'home_event.dart';
part 'home_state.dart';
@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  //nammal use aakunnath same hot and new ayond ahnn
  final HotAndNewService _homeService;
  HomeBloc(this._homeService) : super(HomeState.initial()) {

    //on event gethomescreendata


    on<GetHomeScreenData>((event, emit)async {
      log('Getting Home Screen Data');
      //send loading to UI
emit(state.copyWith(isLoading:true,hasError:false ));
      //GET DATA
final _movieResult=await _homeService.getHotAndNewMovieData();
final _tvResult=await _homeService.getHotAndNewTvData();

//TRANSFORM DATA[ UI load chytha udaane transform cheyanum]
     final _state1= _movieResult.fold(
        (MainFailure failure) {
          return HomeState(
              pastYearMovieList: [],
              trendingMovieList: [],
              tenseDramaMovieList:[],
               southIndianMovieList:[],
              trendingTvList: [],
              isLoading: false,
              hasError: true, Stateid:DateTime.now().millisecondsSinceEpoch.toString());
        },
        (HotAndNewResp resp)  {
          final pastYear=resp.results;
          final trending=resp.results;
          final dramas=resp.results;
          final southIndian=resp.results;

          pastYear.shuffle();
          trending.shuffle();
          dramas.shuffle();
          southIndian.shuffle();

          return HomeState(
              pastYearMovieList:pastYear,
              trendingMovieList: trending,
              tenseDramaMovieList:dramas,
              southIndianMovieList:southIndian,
              trendingTvList:state.trendingTvList,
              isLoading: false,
              hasError:false, Stateid: DateTime.now().millisecondsSinceEpoch.toString());
        },);

emit(_state1);


    final _state2=  _tvResult.fold(
              (MainFailure failure) {
                return HomeState(
                    pastYearMovieList: [],
                    trendingMovieList: [],
                    tenseDramaMovieList:[],
                    southIndianMovieList:[],
                    trendingTvList: [],
                    isLoading: false,
                    hasError: true, Stateid: DateTime.now().millisecondsSinceEpoch.toString());
              },
              (HotAndNewResp resp) {
                final top10List=resp.results;
          return HomeState(
          pastYearMovieList:state.pastYearMovieList,
          trendingMovieList:top10List,
          tenseDramaMovieList:state.tenseDramaMovieList,
          southIndianMovieList:state.southIndianMovieList,
          trendingTvList:top10List,
          isLoading: false,
          hasError:false, Stateid:DateTime.now().millisecondsSinceEpoch.toString());
    },);
    
    //SEND TO UI
      emit(_state2);

//ini nmuk itine display cheyikunnath oru list aait ale ath cheyanum...so athin vendi list create chy EVENTIL
    });
  }
}
