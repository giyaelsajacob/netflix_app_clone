import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';

import '../../domain/new_and_hot/model/new_and_hot.dart';
import '../../domain/new_and_hot/new_and_hot_service.dart';



part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

//aa service ine ee bloc il kond varan injectable use aakuka

@injectable
class HotAndNewBloc extends Bloc<HotandnewEvent, HotAndNewState> {
  final HotAndNewService _hotAndNewService;
  HotAndNewBloc(this._hotAndNewService) : super(HotAndNewState.initial()) {
    //get hot and new movie data


    on<LoadDataInComingSoon>((event, emit) async {
      // send loading to ui
      emit(const HotAndNewState(comingSoonList: [],
          everyOneIsWatchingList: [],
          isLoading: true,
          hasError: false));

      //enthok varunnd en paratyanum,,ithin munne build runner run akit ath injectable il vanno en nokanum

      //get data from remote

      final _result = await _hotAndNewService.getHotAndNewMovieData();

//data to state
//ee new state vannath l,r koduthathin sheshum last
      final newState = _result.fold(
              (MainFailure failure) {
            return HotAndNewState(comingSoonList: [],
                everyOneIsWatchingList: [],
                isLoading: false,
                hasError: true);
          },
              (HotAndNewResp resp) {
            return HotAndNewState(
                comingSoonList: resp.results,
                everyOneIsWatchingList: state.everyOneIsWatchingList,
                isLoading: false,
                hasError: false
            );
          }
      );
      emit(newState);
    });


    //get hot and new tv data
    // ...

    on<LoadDataInEveryOneWatching>((event, emit) async {
      // send loading to ui
      emit(const HotAndNewState(
        comingSoonList: [],
        everyOneIsWatchingList: [],
        isLoading: true,
        hasError: false,
      ));

      try {
        // get data from remote
        final _result = await _hotAndNewService.getHotAndNewTvData();

        // data to state
        final newState = _result.fold(
              (MainFailure failure) {
            return HotAndNewState(
              comingSoonList: state.comingSoonList,
              everyOneIsWatchingList: [],
              isLoading: false,
              hasError: true,
            );
          },
              (HotAndNewResp resp) {
            return HotAndNewState(
              comingSoonList: state.comingSoonList,
              everyOneIsWatchingList: resp.results,
              isLoading: false,
              hasError: false,
            );
          },
        );
        emit(newState);
      } catch (e) {
        // Handle errors, log, or emit an appropriate state
        emit(HotAndNewState(
          comingSoonList: state.comingSoonList,
          everyOneIsWatchingList: [],
          isLoading: false,
          hasError: true,
        ));
      }
    });
  }}
