import 'package:equatable/equatable.dart';

import '../services/model/social_profile.dart';

class SocialProfileState extends Equatable {
  final bool loading;
  final String? errorMessage;
  final List<SocialProfile>? users;

  const SocialProfileState({
    this.loading = false,
    this.errorMessage,
    this.users = const [],
  });

  SocialProfileState copyWith({
    bool? loading,
    String? errorMessage,
    List<SocialProfile>? socialProfile,
  }) {
    return SocialProfileState(
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
      users: socialProfile ?? this.users,
    );
  }

  List<Object?> get props => [
        loading,
        errorMessage,
        users,
      ];
}
