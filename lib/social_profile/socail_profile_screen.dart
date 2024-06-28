import 'package:dummy_api_practice_app/services/model/api/social_profile.dart';
import 'package:dummy_api_practice_app/social_profile/socail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocailProfleScreen extends StatelessWidget {
  const SocailProfleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        //backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text('User List'),
      ),
      body: BlocProvider(
        create: (context) =>
            SocialProfileBloc(userRepository: SocialProfileRepository()),
        child: BlocBuilder<SocialProfileBloc, SocialProfileState>(
          builder: (context, state) {
            if (state.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.users != null) {
              return ListView.builder(
                itemCount: state.users!.length,
                itemBuilder: (context, index) {
                  final user = state.users![index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.coverPhoto),
                      onBackgroundImageError: (exception, stackTrace) {
                        print('Failed to load image: $exception');
                      },
                      child: user.coverPhoto == null || user.coverPhoto.isEmpty
                          ? const Icon(Icons.person)
                          : null,
                    ),
                    title: Text(
                      user.fullName.isNotEmpty ? user.fullName : user.username,
                    ),
                    subtitle: Text(
                        user.bio.isNotEmpty ? user.bio : 'No bio available'),
                  );
                },
              );
            } else if (state.errorMessage != null) {
              return Center(child: Text('Error: ${state.errorMessage}'));
            } else {
              return const Center(child: Text('No users found'));
            }
          },
        ),
      ),
    );
  }
}
