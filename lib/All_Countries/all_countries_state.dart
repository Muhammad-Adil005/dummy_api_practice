import 'package:dummy_api_practice_app/services/model/all_countries_model.dart';
import 'package:equatable/equatable.dart';

class AllCountriesState extends Equatable {
  final bool loading;
  final String? errorMessage;
  final List<AllCountriesModel>? allCountries;

  const AllCountriesState({
    this.loading = false,
    this.errorMessage,
    this.allCountries = const [],
  });

  AllCountriesState copyWith({
    bool? loading,
    String? errorMessage,
    List<AllCountriesModel>? allCountries,
  }) {
    return AllCountriesState(
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
      allCountries: allCountries ?? this.allCountries,
    );
  }

  List<Object?> get props => [
        loading,
        errorMessage,
        allCountries,
      ];
}
