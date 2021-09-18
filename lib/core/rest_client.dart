import 'package:dio/dio.dart' hide Headers;
//import 'package:flutter/material.dart';
import 'package:ingredients_list/domain/ingredients_list/ingredients_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';
//https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list
@RestApi(baseUrl: "https://www.thecocktaildb.com/api/json/v1/")
@lazySingleton
abstract class RestClient {

  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @factoryMethod
  static RestClient create() {
    final dio = Dio()
      ..interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: true,
          request: true,
          requestBody: true));
    return RestClient(dio);
  }

  @GET("1/list.php")
  Future<IngredientsResponseModel> getIngredients(
       @Query("i") String queryi);
}

