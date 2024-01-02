import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/search/model/search_response.dart';

import '../core/failures/main_failure.dart';

abstract class SearchService{
  Future<Either<MainFailure,SearchResponse>>searchMovies({
required String movieQuery,//api nin vilikan vendi
});
}