part of 'search_bloc.dart';

@freezed
 class SearchEvent with _$SearchEvent {
  const factory SearchEvent.initialize()=Initialize;//aadyum bloc  vech initialize chyth
  const factory SearchEvent.searchMovie({
   required String movieQuery,
}) = SearchMovie;
}
