//main failures engne ok varum en ahnu parayunr like client failure k

import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_failure.freezed.dart';
@freezed
class MainFailure  with _$MainFailure{
  const factory MainFailure.clientFailure()=_ClientFailure;
  const factory MainFailure.serverFailure()=_ServerFailure;
}