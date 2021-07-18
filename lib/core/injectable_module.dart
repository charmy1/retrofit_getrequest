import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseInjectableModule {
  @lazySingleton
  Dio get dio => Dio();




}