//inject cheyuvanu ivde
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';

import '../../domain/core/api_end_points.dart';
import '../../domain/core/failures/main_failure.dart';
//i downloads vilikunnadath elam ee downloads repository work aakan vendi ahnu namaml lazy call cheyunath
@LazySingleton(as: IDownloadsRepo)
class DownloadsRepository implements IDownloadsRepo{
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages() async {
    try {
      final Response response =
      await Dio(BaseOptions()).get(
          ApiEndPoints.downloads);
      //print("RESPONSE===>$response");
//get(ApiEndPoints.downloads) ivde namml path paranju koduthu
//ini sttaus check cheyanum
      if (response.statusCode == 200 || response.statusCode == 201) {
      //  print(response.data);//response varunndo en nokaann
        final downloadsList=(response.data['results'] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();
print(downloadsList);
return Right(downloadsList);
      } else {
        return const Left(MainFailure.serverFailure()
        );
      }
    } catch (e) {
      log(e.toString());
      //exception enna en kanan vedni ahnu e koduthe instead of underscore
      return const Left(MainFailure.clientFailure());
    }
  }
}
//api call complete cheyth