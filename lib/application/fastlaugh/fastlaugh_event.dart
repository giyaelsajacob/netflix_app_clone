part of 'fastlaugh_bloc.dart';

@freezed
class FastlaughEvent with _$FastlaughEvent{
  const factory FastlaughEvent.initialize()=Initialize;
  const factory FastlaughEvent.likedVideo(
  {
   required int id
})=LikedVideo;
  const factory FastlaughEvent.unlikedVideo({
    required int id
  })=UnlikedVideo;
}
// in both liked and unliked video we need id