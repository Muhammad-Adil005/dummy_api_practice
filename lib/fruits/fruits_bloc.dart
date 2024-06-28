import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dummy_api_practice_app/fruits/fruits.dart';

import '../services/model/api/fruits.dart';
import '../services/model/fruits_model.dart';

class FruitBloc extends Bloc<FruitEvent, FruitState> {
  final FruitsRepository fruitRepo;
  FruitBloc({required this.fruitRepo}) : super(const FruitState()) {
    registerEvents();
    add(CallFruitApi());
  }

  void registerEvents() {
    on<CallFruitApi>(_onCallFruitApi);
  }

  FutureOr<void> _onCallFruitApi(
      FruitEvent event, Emitter<FruitState> emit) async {
    emit(state.copyWith(loading: true));
    try {
      final response = await fruitRepo.fetchUsers();
      //print('users : $response');
      final fruits =
          response.map((json) => FruitsModel.fromJson(json)).toList();
      emit(state.copyWith(loading: false, fruitPost: fruits));
    } catch (e) {
      emit(state.copyWith(loading: false, errorMessage: e.toString()));
    }
  }
}
