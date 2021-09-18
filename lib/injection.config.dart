// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/ingredients_list/ingredients_bloc.dart' as _i7;
import 'core/injectable_module.dart' as _i8;
import 'core/rest_client.dart' as _i4;
import 'domain/ingredients_list/read_ingredients_interface.dart' as _i5;
import 'infrastructure/ingredients_list/read_ingredients_impl.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<_i3.Dio>(() => firebaseInjectableModule.dio);
  gh.lazySingleton<_i4.RestClient>(() => _i4.RestClient.create());
  gh.lazySingleton<_i5.IngredientsInterface>(
      () => _i6.IngredientsInterfaceImpl(get<_i4.RestClient>()));
  gh.lazySingleton<_i7.IngredientsBloc>(
      () => _i7.IngredientsBloc(get<_i5.IngredientsInterface>()));
  return get;
}

class _$FirebaseInjectableModule extends _i8.FirebaseInjectableModule {}
