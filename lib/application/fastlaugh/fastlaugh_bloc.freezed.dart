// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fastlaugh_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FastlaughEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(int id) likedVideo,
    required TResult Function(int id) unlikedVideo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(int id)? likedVideo,
    TResult? Function(int id)? unlikedVideo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int id)? likedVideo,
    TResult Function(int id)? unlikedVideo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(LikedVideo value) likedVideo,
    required TResult Function(UnlikedVideo value) unlikedVideo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(LikedVideo value)? likedVideo,
    TResult? Function(UnlikedVideo value)? unlikedVideo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(LikedVideo value)? likedVideo,
    TResult Function(UnlikedVideo value)? unlikedVideo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FastlaughEventCopyWith<$Res> {
  factory $FastlaughEventCopyWith(
          FastlaughEvent value, $Res Function(FastlaughEvent) then) =
      _$FastlaughEventCopyWithImpl<$Res, FastlaughEvent>;
}

/// @nodoc
class _$FastlaughEventCopyWithImpl<$Res, $Val extends FastlaughEvent>
    implements $FastlaughEventCopyWith<$Res> {
  _$FastlaughEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$FastlaughEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializeImpl implements Initialize {
  const _$InitializeImpl();

  @override
  String toString() {
    return 'FastlaughEvent.initialize()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(int id) likedVideo,
    required TResult Function(int id) unlikedVideo,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(int id)? likedVideo,
    TResult? Function(int id)? unlikedVideo,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int id)? likedVideo,
    TResult Function(int id)? unlikedVideo,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(LikedVideo value) likedVideo,
    required TResult Function(UnlikedVideo value) unlikedVideo,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(LikedVideo value)? likedVideo,
    TResult? Function(UnlikedVideo value)? unlikedVideo,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(LikedVideo value)? likedVideo,
    TResult Function(UnlikedVideo value)? unlikedVideo,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class Initialize implements FastlaughEvent {
  const factory Initialize() = _$InitializeImpl;
}

/// @nodoc
abstract class _$$LikedVideoImplCopyWith<$Res> {
  factory _$$LikedVideoImplCopyWith(
          _$LikedVideoImpl value, $Res Function(_$LikedVideoImpl) then) =
      __$$LikedVideoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$LikedVideoImplCopyWithImpl<$Res>
    extends _$FastlaughEventCopyWithImpl<$Res, _$LikedVideoImpl>
    implements _$$LikedVideoImplCopyWith<$Res> {
  __$$LikedVideoImplCopyWithImpl(
      _$LikedVideoImpl _value, $Res Function(_$LikedVideoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$LikedVideoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LikedVideoImpl implements LikedVideo {
  const _$LikedVideoImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'FastlaughEvent.likedVideo(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikedVideoImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LikedVideoImplCopyWith<_$LikedVideoImpl> get copyWith =>
      __$$LikedVideoImplCopyWithImpl<_$LikedVideoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(int id) likedVideo,
    required TResult Function(int id) unlikedVideo,
  }) {
    return likedVideo(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(int id)? likedVideo,
    TResult? Function(int id)? unlikedVideo,
  }) {
    return likedVideo?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int id)? likedVideo,
    TResult Function(int id)? unlikedVideo,
    required TResult orElse(),
  }) {
    if (likedVideo != null) {
      return likedVideo(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(LikedVideo value) likedVideo,
    required TResult Function(UnlikedVideo value) unlikedVideo,
  }) {
    return likedVideo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(LikedVideo value)? likedVideo,
    TResult? Function(UnlikedVideo value)? unlikedVideo,
  }) {
    return likedVideo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(LikedVideo value)? likedVideo,
    TResult Function(UnlikedVideo value)? unlikedVideo,
    required TResult orElse(),
  }) {
    if (likedVideo != null) {
      return likedVideo(this);
    }
    return orElse();
  }
}

abstract class LikedVideo implements FastlaughEvent {
  const factory LikedVideo({required final int id}) = _$LikedVideoImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$LikedVideoImplCopyWith<_$LikedVideoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnlikedVideoImplCopyWith<$Res> {
  factory _$$UnlikedVideoImplCopyWith(
          _$UnlikedVideoImpl value, $Res Function(_$UnlikedVideoImpl) then) =
      __$$UnlikedVideoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$UnlikedVideoImplCopyWithImpl<$Res>
    extends _$FastlaughEventCopyWithImpl<$Res, _$UnlikedVideoImpl>
    implements _$$UnlikedVideoImplCopyWith<$Res> {
  __$$UnlikedVideoImplCopyWithImpl(
      _$UnlikedVideoImpl _value, $Res Function(_$UnlikedVideoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$UnlikedVideoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UnlikedVideoImpl implements UnlikedVideo {
  const _$UnlikedVideoImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'FastlaughEvent.unlikedVideo(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnlikedVideoImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnlikedVideoImplCopyWith<_$UnlikedVideoImpl> get copyWith =>
      __$$UnlikedVideoImplCopyWithImpl<_$UnlikedVideoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(int id) likedVideo,
    required TResult Function(int id) unlikedVideo,
  }) {
    return unlikedVideo(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(int id)? likedVideo,
    TResult? Function(int id)? unlikedVideo,
  }) {
    return unlikedVideo?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int id)? likedVideo,
    TResult Function(int id)? unlikedVideo,
    required TResult orElse(),
  }) {
    if (unlikedVideo != null) {
      return unlikedVideo(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(LikedVideo value) likedVideo,
    required TResult Function(UnlikedVideo value) unlikedVideo,
  }) {
    return unlikedVideo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(LikedVideo value)? likedVideo,
    TResult? Function(UnlikedVideo value)? unlikedVideo,
  }) {
    return unlikedVideo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(LikedVideo value)? likedVideo,
    TResult Function(UnlikedVideo value)? unlikedVideo,
    required TResult orElse(),
  }) {
    if (unlikedVideo != null) {
      return unlikedVideo(this);
    }
    return orElse();
  }
}

abstract class UnlikedVideo implements FastlaughEvent {
  const factory UnlikedVideo({required final int id}) = _$UnlikedVideoImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$UnlikedVideoImplCopyWith<_$UnlikedVideoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FastlaughState {
  List<Downloads> get videosList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get iserror => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FastlaughStateCopyWith<FastlaughState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FastlaughStateCopyWith<$Res> {
  factory $FastlaughStateCopyWith(
          FastlaughState value, $Res Function(FastlaughState) then) =
      _$FastlaughStateCopyWithImpl<$Res, FastlaughState>;
  @useResult
  $Res call({List<Downloads> videosList, bool isLoading, bool iserror});
}

/// @nodoc
class _$FastlaughStateCopyWithImpl<$Res, $Val extends FastlaughState>
    implements $FastlaughStateCopyWith<$Res> {
  _$FastlaughStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videosList = null,
    Object? isLoading = null,
    Object? iserror = null,
  }) {
    return _then(_value.copyWith(
      videosList: null == videosList
          ? _value.videosList
          : videosList // ignore: cast_nullable_to_non_nullable
              as List<Downloads>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      iserror: null == iserror
          ? _value.iserror
          : iserror // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $FastlaughStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Downloads> videosList, bool isLoading, bool iserror});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$FastlaughStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videosList = null,
    Object? isLoading = null,
    Object? iserror = null,
  }) {
    return _then(_$InitialImpl(
      videosList: null == videosList
          ? _value._videosList
          : videosList // ignore: cast_nullable_to_non_nullable
              as List<Downloads>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      iserror: null == iserror
          ? _value.iserror
          : iserror // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required final List<Downloads> videosList,
      required this.isLoading,
      required this.iserror})
      : _videosList = videosList;

  final List<Downloads> _videosList;
  @override
  List<Downloads> get videosList {
    if (_videosList is EqualUnmodifiableListView) return _videosList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videosList);
  }

  @override
  final bool isLoading;
  @override
  final bool iserror;

  @override
  String toString() {
    return 'FastlaughState(videosList: $videosList, isLoading: $isLoading, iserror: $iserror)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._videosList, _videosList) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.iserror, iserror) || other.iserror == iserror));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_videosList), isLoading, iserror);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements FastlaughState {
  const factory _Initial(
      {required final List<Downloads> videosList,
      required final bool isLoading,
      required final bool iserror}) = _$InitialImpl;

  @override
  List<Downloads> get videosList;
  @override
  bool get isLoading;
  @override
  bool get iserror;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
