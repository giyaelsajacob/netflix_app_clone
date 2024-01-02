//nammal enthok image,enthok vikichu en parnju kodukukayahnu
import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';

abstract class IDownloadsRepo{
  //namlk enthok api calls varunnd en munkooti parayuvanu,ipo downloads il image matarame varath ollu,ath paranjn  kodukanam
//api oru time consuming process ahnu nathond ahnu future use cheytath
Future<Either<MainFailure,List<Downloads>>>getDownloadsImages();
}