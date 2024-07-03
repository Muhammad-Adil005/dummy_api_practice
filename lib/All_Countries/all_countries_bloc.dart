import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dummy_api_practice_app/All_Countries/all_countries.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../services/model/all_countries_model.dart';
import '../services/model/api/all_countries.dart';
import '../services/model/state_details_model.dart';
import '../services/model/state_model.dart';

class AllCountriesBloc extends Bloc<AllCountriesEvent, AllCountriesState> {
  final AllCountriesRepository fetchCountries;

  AllCountriesBloc({required this.fetchCountries})
      : super(const AllCountriesState()) {
    initializeForm();
    registerEvents();
    add(CallAllCountriesApi());
  }

  late FormGroup countries;

  void initializeForm() {
    countries = FormGroup({
      'allCountries': FormControl<String>(validators: [Validators.required])
        ..valueChanges.listen((value) {
          if (value != null) {
            final selectedCountry = state.allCountries!
                .firstWhere((country) => country.name == value);

            print('SelectedCountry : $selectedCountry');

            countries.control('allStates').reset();
            add(CallAllStatesApi(selectedCountry.iSO2));
          }
        }),
      'allStates': FormControl<String>()
        ..valueChanges.listen((value) {
          if (value != null) {
            final stateDetails =
                state.allStates!.firstWhere((state) => state.name == value);

            print('stateDetails : $stateDetails');

            countries.control('stateDetails').reset();
            // add(CallStatesDetailsApi(stateDetails.iso2, stateDetails.name));
            add(CallStatesDetailsApi(stateDetails.iso2, stateDetails.iso2));
          }
        }),
      'stateDetails': FormControl<String>(),
    });
  }

  // void initializeForm() {
  //   countries = FormGroup({
  //     'allCountries': FormControl<String>(validators: [Validators.required])
  //       ..valueChanges.listen((value) {
  //         if (value != null) {
  //           //print('Country selected: $value');
  //           countries.control('allStates').reset();
  //           add(CallAllStatesApi(value));
  //         }
  //       }),
  //     'allStates': FormControl<String>(),
  //   });
  // }

  // final FormGroup countries = FormGroup({
  //   'allCountries': FormControl<String>(validators: [Validators.required])
  //     ..valueChanges.listen((value) {
  //       if (value != null) {
  //         countries.control('allStates').reset();
  //         add(CallAllStatesApi(value));
  //       }
  //     }),
  //   'allStates': FormControl<String>(),
  // });

  void registerEvents() {
    on<CallAllCountriesApi>(_onCallAllCountriesApi);
    on<CallAllStatesApi>(_onCallAllStatesApi);
    on<CallStatesDetailsApi>(_onCallStatesDetailsApi);
  }

  FutureOr<void> _onCallAllCountriesApi(
      CallAllCountriesApi event, Emitter<AllCountriesState> emit) async {
    emit(state.copyWith(loading: true));
    try {
      final response = await fetchCountries.fetchCountries();
      //if (response != null && response is List) {
      if (response != null) {
        //List<AllCountriesModel> countries = [];
        // List<AllCountriesModel> allCountries =
        //     response.map((json) => AllCountriesModel.fromJson(json)).toList();
        List<AllCountriesModel> allCountries = response
            .map((json) =>
                AllCountriesModel.fromJson(json as Map<String, dynamic>))
            .toList();
        emit(state.copyWith(loading: false, allCountries: allCountries));
      } else {
        emit(state.copyWith(loading: false, errorMessage: 'Invalid response'));
      }
    } catch (e) {
      emit(state.copyWith(loading: false, errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onCallAllStatesApi(
      CallAllStatesApi event, Emitter<AllCountriesState> emit) async {
    //emit(state.copyWith(loading: true));
    emit(state.copyWith(stateLoading: true));
    try {
      final response = await fetchCountries.fetchStates(event.iso2);
      // if (response != null && response is List) {
      //final allStates = response.map((json) => StateModel.fromJson(json)).toList();
      final allStates = response
          .map((json) => StateModel.fromJson(json as Map<String, dynamic>))
          .toList();
      emit(state.copyWith(stateLoading: false, allStates: allStates));
    } catch (e) {
      emit(state.copyWith(stateLoading: false, errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onCallStatesDetailsApi(
      CallStatesDetailsApi event, Emitter<AllCountriesState> emit) async {
    //emit(state.copyWith(loading: true));
    emit(state.copyWith(stateLoading: true));
    try {
      print(
          'Fetching state details for iso2: ${event.iso2}, province: ${event.province}');
      final response =
          await fetchCountries.fetchStateDetails(event.iso2, event.province);
      // if (response != null && response is List) {
      //final allStates = response.map((json) => StateModel.fromJson(json)).toList();
      final statesDetails = response
          .map((json) =>
              StateDetailsModel.fromJson(json as Map<String, dynamic>))
          .toList();
      emit(state.copyWith(stateLoading: false, stateDetails: statesDetails));
    } catch (e) {
      emit(state.copyWith(stateLoading: false, errorMessage: e.toString()));
    }
  }
}
