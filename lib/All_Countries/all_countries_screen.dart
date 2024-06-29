import 'package:dummy_api_practice_app/All_Countries/all_countries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../services/model/api/all_countries.dart';

class AllCountriesScreen extends StatelessWidget {
  AllCountriesScreen({super.key});

  final FormGroup countriesForm = FormGroup({
    'allCountries': FormControl<String>(validators: [Validators.required]),
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AllCountriesBloc(fetchCountries: AllCountriesRepository()),
      child: ReactiveForm(
        formGroup: countriesForm,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Countries'),
            surfaceTintColor: Colors.transparent,
          ),
          body: BlocBuilder<AllCountriesBloc, AllCountriesState>(
            builder: (context, state) {
              //final bloc = context.read<AllCountriesBloc>().countries;
              if (state.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.errorMessage != null) {
                return Text('Error : ${state.errorMessage}');
              }
              return Padding(
                padding: const EdgeInsets.all(16),
                child: ReactiveDropdownField(
                  formControlName: 'allCountries',
                  decoration: const InputDecoration(
                    //labelText: 'Select Country',
                    hintText: 'Select Country',
                    border: OutlineInputBorder(),
                  ),
                  items: state.allCountries!
                      .map<DropdownMenuItem<String>>((country) {
                    return DropdownMenuItem<String>(
                      value: country.name,
                      child: Text(country.name),
                    );
                  }).toList(),
                ),
              );
              /* ListView.builder(
                itemCount: state.allCountries!.length,
                itemBuilder: (context, index) {
                  final value = state.allCountries![index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Text('name : ${value.name}'),
                      ReactiveTextField<String>(
                        formControlName: 'allCountries',
                        decoration: const InputDecoration(
                          labelText: 'AllCountries',
                        ),
                      ),
                      //   ReactiveTextField(),
                    ],
                  );
                },
              );*/
            },
          ),
        ),
      ),
    );
  }
}
