import 'package:freezed_annotation/freezed_annotation.dart';
part 'downloads.freezed.dart';

 //from json to json athin vedni oru extension add chyanum

part 'downloads.g.dart';
@freezed
class Downloads with _$Downloads{
  const factory Downloads({
@JsonKey(name:"poster_path")
required String? posterPath,

//namuk aapi il nokiyal kanam poster_path en ahnu,but namak _ kodukan pattilla athond ahnu namaml jsonkey use akiyath

     @JsonKey(name:"title")
     required String? title,
  }) = _Downloads;
  factory Downloads.fromJson(Map<String,dynamic>json)=>
      _$DownloadsFromJson(json);
}
