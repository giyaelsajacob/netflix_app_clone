// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../application/downloads/downloads_bloc.dart' as _i10;
import '../../application/fastlaugh/fastlaugh_bloc.dart' as _i11;
import '../../application/home/home_bloc.dart' as _i12;
import '../../application/hot_and_new/hot_and_new_bloc.dart' as _i13;
import '../../application/search/search_bloc.dart' as _i14;
import '../../domain/downloads/i_downloads_repo.dart' as _i6;
import '../../domain/new_and_hot/new_and_hot_service.dart' as _i4;
import '../../domain/search/search_service.dart' as _i8;
import '../../infrastructure/downloads/downloads_repository.dart' as _i7;
import '../../infrastructure/hot_and_new/hot_and_new_implentataion.dart' as _i5;
import '../../infrastructure/search/search_implementation.dart' as _i9;
import 'dio_module.dart' as _i15; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final dioModule = _$DioModule();
  gh.lazySingleton<_i3.Dio>(() => dioModule.dio);
  gh.lazySingleton<_i4.HotAndNewService>(() => _i5.HotAndNewImplementataion());
  gh.lazySingleton<_i6.IDownloadsRepo>(() => _i7.DownloadsRepository());
  gh.lazySingleton<_i8.SearchService>(
      () => _i9.SearchImplementation(get<_i3.Dio>()));
  gh.factory<_i10.DownloadsBloc>(
      () => _i10.DownloadsBloc(get<_i6.IDownloadsRepo>()));
  gh.factory<_i11.FastlaughBloc>(
      () => _i11.FastlaughBloc(get<_i6.IDownloadsRepo>()));
  gh.factory<_i12.HomeBloc>(() => _i12.HomeBloc(get<_i4.HotAndNewService>()));
  gh.factory<_i13.HotAndNewBloc>(
      () => _i13.HotAndNewBloc(get<_i4.HotAndNewService>()));
  gh.factory<_i14.SearchBloc>(() => _i14.SearchBloc(
        get<_i8.SearchService>(),
        get<_i6.IDownloadsRepo>(),
      ));
  return get;
}

class _$DioModule extends _i15.DioModule {}
