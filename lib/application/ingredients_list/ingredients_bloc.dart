import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ingredients_list/core/failures.dart';
import 'package:ingredients_list/domain/ingredients_list/ingredients_response_model.dart';
import 'package:ingredients_list/domain/ingredients_list/read_ingredients_interface.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'ingredients_bloc.freezed.dart';

part 'ingredients_event.dart';

part 'ingredients_state.dart';
@lazySingleton
class IngredientsBloc extends Bloc<IngredientsEvent, IngredientsState> {
  final IngredientsInterface _ingredientsInterface;

  IngredientsBloc(this._ingredientsInterface)
      : super(IngredientsState.initial());

  @override
  Stream<IngredientsState> mapEventToState(
    IngredientsEvent event,
  ) async* {
    yield* event.map(readAllIngredients: (e) async* {
      yield state.copyWith(
          isSubmitting: true);

      var result = await _ingredientsInterface.readAllIngredients();

      yield state.copyWith(
          isSubmitting: false, readFailureOrSuccessOption: optionOf(result));
    });
  }

  @override
  void onTransition(
      Transition<IngredientsEvent, IngredientsState>
      transition) {
    super.onTransition(transition);
    print("IngredientsBloc");

    print(transition.currentState);
    print(transition.nextState);
  }
}
