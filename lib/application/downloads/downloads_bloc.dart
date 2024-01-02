


import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/core/failures/main_failure.dart';
import '../../domain/downloads/i_downloads_repo.dart';
import '../../domain/downloads/models/downloads.dart';
part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

// @injectable //en vechal ee idownloas evde hnu vende avide elam downloads repo inject cheyum
// class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
//   //ini api call cheyan vendi nammal idownloadsrepo il pokum,so athinte object ahnu ivde create cheyathth,ath required aait kodukuka
//
//   final IDownloadsRepo _downloadsRepo;
//   DownloadsBloc(this._downloadsRepo) : super(DownloadsState.initial()) {
//     on<_GetDownloadsImage>((event, emit) async {
//       //api call cheyan povanu,loading ahnu en kanikan vendi
//       //ivde ipo api matarm koduth
//       emit(
//         state.copyWith(
//           isLoading: true,downloadsFailureOrSuccessOption: none(),
//         ),
//       );
// //ini api fetch cheyanum
// //nammal ivde oru value ee downloadsOption value ilot aa store aakiyatg
//  final Either<MainFailure,List<Downloads>>downloadsOption=await _downloadsRepo.getDownloadsImages();
//  log(downloadsOption.toString());
//  //ivde ahnu image varunnath,nammalde api call ayo en print cheyth nokam
// //namk ipo kitiya response ine nammal emit cheyan pova ini,athin munne response nokanaum
//     emit(
//         downloadsOption.fold((failure) =>
//             state.copyWith(
//                 isLoading: false,
//                 downloadsFailureOrSuccessOption: Some(Left(failure)),
//
//             ),
//
//             (success) => state.copyWith(
//                 isLoading:false,
//                 //success aai en paranju koduknm
//                 downloads:success,
//                 downloadsFailureOrSuccessOption:Some(Right(success)) )));
//
//     });
//   }
// }
@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo _downloadsRepo;

  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.initial()) {
    on<_GetDownloadsImage>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          downloadsFailureOrSuccessOption: none(),
        ),
      );

      final Either<MainFailure, List<Downloads>> downloadsOption =
      await _downloadsRepo.getDownloadsImages();

      emit(
        downloadsOption.fold(
              (failure) => state.copyWith(
            isLoading: false,
            downloadsFailureOrSuccessOption: Some(Left(failure)),
          ),
              (success) => state.copyWith(
            isLoading: false,
            downloads: success,
            downloadsFailureOrSuccessOption: Some(Right(success)),
          ),
        ),
      );
    });
  }
}
