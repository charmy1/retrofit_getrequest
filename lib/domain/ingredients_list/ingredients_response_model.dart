import 'package:freezed_annotation/freezed_annotation.dart';

import 'ingredients_model.dart';

part 'ingredients_response_model.freezed.dart';

part 'ingredients_response_model.g.dart';

@freezed
abstract class IngredientsResponseModel with _$IngredientsResponseModel {
  @JsonSerializable(explicitToJson: true)
  const factory IngredientsResponseModel({
    List<IngredientsModel> drinks,
  }) = _IngredientsResponseModel;

  factory IngredientsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientsResponseModelFromJson(json);
}
