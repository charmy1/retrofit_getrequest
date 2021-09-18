part of 'ingredients_bloc.dart';

@freezed
class IngredientsEvent with _$IngredientsEvent {
  const factory IngredientsEvent.readAllIngredients() = ReadAllIngredients;
}


