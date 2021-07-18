import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredients_model.freezed.dart';
part 'ingredients_model.g.dart';
@freezed

abstract class IngredientsModel with _$IngredientsModel {
  @JsonSerializable(explicitToJson: true)
  const factory IngredientsModel({
    String strIngredient1,

  }) = _IngredientsModel;

  factory IngredientsModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientsModelFromJson(json);


}
