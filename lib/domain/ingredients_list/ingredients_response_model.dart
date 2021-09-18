import 'package:freezed_annotation/freezed_annotation.dart';

import 'ingredients_model.dart';

part 'ingredients_response_model.freezed.dart';

part 'ingredients_response_model.g.dart';

@freezed
 class IngredientsResponseModel with _$IngredientsResponseModel {

 const IngredientsResponseModel._();

 @JsonSerializable(explicitToJson: true)
  const factory IngredientsResponseModel({
    required List<IngredientsModel?> drinks,
  }) = _IngredientsResponseModel;

  factory IngredientsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientsResponseModelFromJson(json);
}
