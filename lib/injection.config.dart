// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:ingredients_list/application/ingredients_list/ingredients_bloc.dart'
    as _i7;
import 'package:ingredients_list/core/injectable_module.dart' as _i8;
import 'package:ingredients_list/core/rest_client.dart' as _i4;
import 'package:ingredients_list/domain/ingredients_list/read_ingredients_interface.dart'
    as _i5;
import 'package:ingredients_list/infrastructure/ingredients_list/read_ingredients_impl.dart'
    as _i6;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseInjectableModule = _$FirebaseInjectableModule();
    gh.lazySingleton<_i3.Dio>(() => firebaseInjectableModule.dio);
    gh.lazySingleton<_i4.RestClient>(() => _i4.RestClient.create());
    gh.lazySingleton<_i5.IngredientsInterface>(
        () => _i6.IngredientsInterfaceImpl(gh<_i4.RestClient>()));
    gh.lazySingleton<_i7.IngredientsBloc>(
        () => _i7.IngredientsBloc(gh<_i5.IngredientsInterface>()));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i8.FirebaseInjectableModule {}
