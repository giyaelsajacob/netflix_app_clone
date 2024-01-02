import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';
import '../../domain/downloads/i_downloads_repo.dart';
import '../../domain/downloads/models/downloads.dart';
import '../../domain/search/model/search_response.dart';
import '../../domain/search/search_service.dart';
part 'search_bloc.freezed.dart';

part 'search_event.dart';
part 'search_state.dart';
@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
 final IDownloadsRepo _downloadsService;
 final SearchService _searchService;
  SearchBloc(this._searchService, this._downloadsService) : super(SearchState.initial()) {
    //idle state
    on<Initialize>((event, emit) async {
      if(state.idleList.isNotEmpty){
        emit(SearchState(
            searchResultList:[],
            idleList:state.idleList,
            isLoading:false,
            isError: false));
        return;// ingne chythath kond namlk screen search il kerumbo oru progressindicator ile ath pokkolum
      }
      emit(const SearchState(searchResultList:[],
          idleList:[],
          isLoading:true,
          isError: false));
      //get trending
      //itil data correct aait varunnd so namak athine edukama
final _result=await _downloadsService.getDownloadsImages();
//next fold
    _result.fold((MainFailure f){
      emit(const SearchState(searchResultList:[],
          idleList:[],
          isLoading:false,
          isError:true));
    }, (List<Downloads>list) {
      emit(SearchState(searchResultList:[],
          idleList:list,
          isLoading:false,
          isError:false));
    },);//curly braces itath avide ena varunne en kanikan ahnu
      //show to ui
    });
    //search result state
    on<SearchMovie>((event, emit) async {
//call search movie api
    log('Searching for ${event.movieQuery}');
    emit(const SearchState(searchResultList:[],
        idleList:[],
        isLoading:true,
        isError: false));
  final _result= await _searchService.searchMovies(movieQuery: event.movieQuery);//nammalde movie query ullath event inte ullil ahnnuuu
    final _state=_result.fold(
            (MainFailure f)  {
    return const SearchState(searchResultList:[],
    idleList:[],
    isLoading:false,
    isError:true);
    },
            (SearchResponse? r) {
              final resultList=r?.results??[];
      return SearchState(
          searchResultList:resultList,//R.RESULTS AA KODUTHE ERROR VANNU
          idleList:[],
          isLoading:false,
          isError:false);
    });
      //show to ui

emit(_state);
    });
  }

}