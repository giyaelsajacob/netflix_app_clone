// import 'dart:developer';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import 'package:netflix_app/domain/core/failures/main_failure.dart';
// import 'package:netflix_app/domain/search/model/search_response.dart';
// import 'package:netflix_app/domain/search/search_service.dart';
//
// import '../../domain/core/api_end_points.dart';
// @LazySingleton(as:SearchService)
//
// class SearchImplementataion implements SearchService{
//   @override
//   Future<Either<MainFailure, SearchResponse>> searchMovies({required String movieQuery}) async{
//     try {
//       final Response response = await Dio(BaseOptions()).get(
//           ApiEndPoints.search,
//           queryParameters:{'query':movieQuery
//           });
//       //print("RESPONSE===>$response");
// //get(ApiEndPoints.downloads) ivde namml path paranju koduthu
//
// //ini sttaus check cheyanum
//
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final result=SearchResponse.fromJson(response.data);
//         return Right(result);
//       } else {
//         return const Left(MainFailure.serverFailure()
//         );
//       }
//     } catch (e) {
//       log(e.toString());
//
//       //exception enna en kanan vedni ahnu e koduthe instead of underscore
//
//       return const Left(MainFailure.clientFailure());
//     }
//   }
// }


import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/api_end_points.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';
import 'package:netflix_app/domain/search/model/search_response.dart';
import 'package:netflix_app/domain/search/search_service.dart';

@LazySingleton(as: SearchService)
class SearchImplementation implements SearchService {
  final Dio _dio; // Inject Dio as a dependency

  SearchImplementation(this._dio);

  @override
  Future<Either<MainFailure, SearchResponse>> searchMovies({required String movieQuery}) async {
    try {
      final Response response = await _dio.get(
        ApiEndPoints.search,
        queryParameters: {'query': movieQuery},
      );
      //log expect cheyunnath oru string ayirunnu but response oru map aayirunnu
//log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResponse.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    }
    on DioError catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
    catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
