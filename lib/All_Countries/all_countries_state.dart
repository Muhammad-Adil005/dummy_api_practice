import 'package:dummy_api_practice_app/services/model/all_countries_model.dart';
import 'package:dummy_api_practice_app/services/model/state_model.dart';
import 'package:equatable/equatable.dart';

import '../services/model/state_details_model.dart';

class AllCountriesState extends Equatable {
  final bool loading;
  final String? errorMessage;
  final List<AllCountriesModel>? allCountries;
  final List<StateModel>? allStates;
  final List<StateDetailsModel>? stateDetails;
  final bool stateLoading;

  const AllCountriesState({
    this.loading = false,
    this.errorMessage,
    this.allCountries = const [],
    this.allStates = const [],
    this.stateLoading = false,
    this.stateDetails = const [],
  });

  AllCountriesState copyWith({
    bool? loading,
    String? errorMessage,
    List<AllCountriesModel>? allCountries,
    List<StateModel>? allStates,
    List<StateDetailsModel>? stateDetails,
    bool? stateLoading,
  }) {
    return AllCountriesState(
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
      allCountries: allCountries ?? this.allCountries,
      allStates: allStates ?? this.allStates,
      stateLoading: stateLoading ?? this.stateLoading,
      stateDetails: stateDetails ?? this.stateDetails,
    );
  }

  List<Object?> get props => [
        loading,
        errorMessage,
        allCountries,
        allStates,
        stateDetails,
        stateLoading,
      ];
}
