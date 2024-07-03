import 'package:dummy_api_practice_app/All_Countries/all_countries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../services/model/api/all_countries.dart';

class AllCountriesScreen extends StatelessWidget {
  const AllCountriesScreen({super.key});

  // final FormGroup countriesForm = FormGroup({
  //   'allCountries': FormControl<String>(validators: [Validators.required]),
  //   'allStates': FormControl<String>(),
  // });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AllCountriesBloc(fetchCountries: AllCountriesRepository()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Countries'),
          surfaceTintColor: Colors.transparent,
        ),
        body: BlocBuilder<AllCountriesBloc, AllCountriesState>(
          builder: (context, state) {
            final bloc = context.read<AllCountriesBloc>().countries;
            if (state.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.errorMessage != null) {
              return Text('Error : ${state.errorMessage}');
            }
            //final form = context.read<AllCountriesBloc>().countries;
            return Padding(
              padding: const EdgeInsets.all(16),
              child: ReactiveForm(
                formGroup: bloc,
                child: Column(
                  children: [
                    ReactiveDropdownField(
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
                    const SizedBox(height: 32),
                    Stack(
                      children: [
                        ReactiveDropdownField(
                          formControlName: 'allStates',
                          decoration: const InputDecoration(
                            hintText: 'Select State',
                            border: OutlineInputBorder(),
                          ),
                          items: state.allStates == null
                              ? []
                              : state.allStates!
                                  .map<DropdownMenuItem<String>>((state) {
                                  return DropdownMenuItem<String>(
                                    //value: state.iso2,
                                    value: state.name,
                                    child: Text(state.name),
                                  );
                                }).toList(),
                        ),
                        // if (state.stateLoading)
                        //   Positioned.fill(
                        //     child: Container(
                        //       color: Colors.black.withOpacity(0.1),
                        //       child: const Center(
                        //         child: CircularProgressIndicator(),
                        //       ),
                        //     ),
                        //   ),
                        if (state.stateLoading)
                          const Positioned.fill(
                            child: ColoredBox(
                              color: Colors.white70,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    ReactiveDropdownField(
                      formControlName: 'stateDetails',
                      decoration: const InputDecoration(
                        hintText: 'Select State Details',
                        border: OutlineInputBorder(),
                      ),
                      items: state.stateDetails == null
                          ? []
                          : state.stateDetails!
                              .map<DropdownMenuItem<String>>((stateDetails) {
                              return DropdownMenuItem<String>(
                                //value: state.iso2,
                                value: stateDetails.name,
                                child: Text(stateDetails.name),
                              );
                            }).toList(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

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
