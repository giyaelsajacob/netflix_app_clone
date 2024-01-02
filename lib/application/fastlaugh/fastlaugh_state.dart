 part of 'fastlaugh_bloc.dart';

@freezed


class FastlaughState with _$FastlaughState{
  const factory FastlaughState({
 required List<Downloads>videosList,

    required bool isLoading,
    required bool iserror,
})=_Initial;
  factory FastlaughState.initial()=>const FastlaughState(videosList:[], isLoading:true, iserror:false);
}
