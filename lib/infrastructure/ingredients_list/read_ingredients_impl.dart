import 'package:dartz/dartz.dart';
import 'package:ingredients_list/core/failures.dart';
import 'package:ingredients_list/core/rest_client.dart';
import 'package:ingredients_list/domain/ingredients_list/ingredients_response_model.dart';
import 'package:ingredients_list/domain/ingredients_list/read_ingredients_interface.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IngredientsInterface)
class IngredientsInterfaceImpl implements IngredientsInterface {
  final RestClient _restClient;

  IngredientsInterfaceImpl(this._restClient);

  @override
  Future<Either<Failure, IngredientsResponseModel>> readAllIngredients() async {
    try {
      var result = await _restClient.getIngredients(queryi: "list");
      print("Data");
      print(result.toString());

      return right(result);
    } catch (e) {
      print(e);
      return Left(ServerFailure());
    }
  }
}
