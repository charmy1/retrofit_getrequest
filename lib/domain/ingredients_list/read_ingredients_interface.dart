
import 'package:dartz/dartz.dart';
import 'package:ingredients_list/core/failures.dart';
import 'package:ingredients_list/domain/ingredients_list/ingredients_response_model.dart';

abstract class IngredientsInterface {
  Future<Either<Failure, IngredientsResponseModel>> readAllIngredients();

  
  
}

