part of 'ingredients_bloc.dart';

@freezed
class IngredientsState with _$IngredientsState {
  const factory IngredientsState({
    required
     Option<Either<Failure, IngredientsResponseModel>>
        readFailureOrSuccessOption,
    required
     bool isSubmitting,
  }) = _IngredientsState;

  factory IngredientsState.initial() => IngredientsState(
        isSubmitting: false,
        readFailureOrSuccessOption: none(),
      );
}
