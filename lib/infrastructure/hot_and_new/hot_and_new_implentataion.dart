import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';
import 'package:netflix_app/domain/new_and_hot/model/new_and_hot.dart';
import 'package:netflix_app/domain/new_and_hot/new_and_hot_service.dart';

import '../../domain/core/api_end_points.dart';
import '../../domain/search/model/search_response.dart';
//ini hot and new service vilikumbo namalk ee implementataion ahnukodukande so athine lazy singleton aakai mataanum
@LazySingleton(as:HotAndNewService)
class HotAndNewImplementataion implements HotAndNewService{
  Dio _dio = Dio();
  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewMovieData() async{
    try {
      final Response response = await _dio.get(
        ApiEndPoints.hotAndNewMovie,
      );
      //log expect cheyunnath oru string ayirunnu but response oru map aayirunnu
//log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
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

  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewTvData() async {
    try {
      final Response response = await _dio.get(
        ApiEndPoints.hotAndNewTv,
      );
      //log expect cheyunnath oru string ayirunnu but response oru map aayirunnu
//log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
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

