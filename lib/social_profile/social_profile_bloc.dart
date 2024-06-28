import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/model/api/social_profile.dart';
import '../services/model/social_profile.dart';
import 'socail.dart';

class SocialProfileBloc extends Bloc<SocialProfileEvent, SocialProfileState> {
  final SocialProfileRepository userRepository;
  SocialProfileBloc({required this.userRepository})
      : super(const SocialProfileState()) {
    registerEvents();
    add(FetchUsers());
  }

  //late UserRepository _userRepository;

  void registerEvents() {
    on<FetchUsers>(_onFetchUsers);
  }

  FutureOr<void> _onFetchUsers(
      FetchUsers event, Emitter<SocialProfileState> emit) async {
    emit(state.copyWith(loading: true));
    try {
      final response = await userRepository.fetchUsers();
      print('users : $response');
      final users =
          response.map((json) => SocialProfile.fromJson(json)).toList();
      emit(state.copyWith(loading: false, socialProfile: users));
    } catch (e) {
      emit(state.copyWith(loading: false, errorMessage: e.toString()));
    }
  }
}
