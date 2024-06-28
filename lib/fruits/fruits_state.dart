import 'package:dummy_api_practice_app/services/model/fruits_model.dart';
import 'package:equatable/equatable.dart';

class FruitState extends Equatable {
  final bool loading;
  final String errorMessage;
  final List<FruitsModel>? fruitPost;

  const FruitState({
    this.loading = false,
    this.errorMessage = " ",
    this.fruitPost = const [],
  });

  FruitState copyWith({
    bool? loading,
    String? errorMessage,
    List<FruitsModel>? fruitPost,
  }) {
    return FruitState(
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
      fruitPost: fruitPost ?? this.fruitPost,
    );
  }

  List<Object?> get props => [
        loading,
        errorMessage,
        fruitPost,
      ];
}
