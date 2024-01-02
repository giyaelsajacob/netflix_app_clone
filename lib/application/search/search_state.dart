part of 'search_bloc.dart';

@freezed
 class SearchState with _$SearchState{
  const factory SearchState(
  {
required List<SearchResultData>searchResultList,
  required List<Downloads>idleList,
  //ini downloads ine control aakan vendi 2 bool set aakanum
  required bool isLoading,
  required bool isError,
})
=_SearchState;
  factory SearchState.initial()=>SearchState(
      searchResultList: [],
      idleList: [],
      isLoading: false,
      isError: false);
}


