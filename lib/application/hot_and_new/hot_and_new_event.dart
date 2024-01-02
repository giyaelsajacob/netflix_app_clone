part of 'hot_and_new_bloc.dart';

@freezed
class HotandnewEvent with _$HotandnewEvent{
  factory HotandnewEvent.loadDataInComingSoon()=LoadDataInComingSoon;
  factory HotandnewEvent.loadDataInEveryOneWatching()=LoadDataInEveryOneWatching;



}