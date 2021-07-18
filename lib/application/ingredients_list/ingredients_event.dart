part of 'ingredients_bloc.dart';

@freezed
abstract class IngredientsEvent with _$IngredientsEvent {
  const factory IngredientsEvent.readAllIngredients() = ReadAllIngredients;
}
