import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dummy_api_practice_app/All_Countries/all_countries.dart';

import '../services/model/all_countries_model.dart';
import '../services/model/api/all_countries.dart';

class AllCountriesBloc extends Bloc<AllCountriesEvent, AllCountriesState> {
  final AllCountriesRepository fetchCountries;
  AllCountriesBloc({required this.fetchCountries})
      : super(const AllCountriesState()) {
    registerEvents();
    add(CallAllCountriesApi());
  }

  // final countries = FormGroup({
  //   'allCountries': FormControl<String>(validators: [Validators.required]),
  // });

  void registerEvents() {
    on<CallAllCountriesApi>(_onCallAllCountriesApi);
  }

  FutureOr<void> _onCallAllCountriesApi(
      CallAllCountriesApi event, Emitter<AllCountriesState> emit) async {
    emit(state.copyWith(loading: true));
    try {
      final response = await fetchCountries.fetchUsers();
      if (response != null && response is List) {
        final allCountries =
            response.map((json) => AllCountriesModel.fromJson(json)).toList();
        emit(state.copyWith(loading: false, allCountries: allCountries));
      } else {
        emit(state.copyWith(loading: false, errorMessage: 'Invalid response'));
      }
    } catch (e) {
      emit(state.copyWith(loading: false, errorMessage: e.toString()));
    }
  }
}
