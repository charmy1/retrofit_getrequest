// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'core/injectable_module.dart';
import 'application/ingredients_list/ingredients_bloc.dart';
import 'domain/ingredients_list/read_ingredients_interface.dart';
import 'infrastructure/ingredients_list/read_ingredients_impl.dart';
import 'core/rest_client.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<Dio>(() => firebaseInjectableModule.dio);
  gh.lazySingleton<RestClient>(() => RestClient.create());
  gh.lazySingleton<IngredientsInterface>(
      () => IngredientsInterfaceImpl(get<RestClient>()));
  gh.lazySingleton<IngredientsBloc>(
      () => IngredientsBloc(get<IngredientsInterface>()));
  return get;
}

class _$FirebaseInjectableModule extends FirebaseInjectableModule {}
