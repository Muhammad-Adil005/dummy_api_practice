import 'package:dummy_api_practice_app/blog_post/blog_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/model/api/blog_post.dart';

class BlogPostScreen extends StatelessWidget {
  const BlogPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        //backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text('Blog List'),
      ),
      body: BlocProvider(
        create: (context) => BlogPostBloc(blocPostRepo: BlogPostRepository()),
        child: BlocBuilder<BlogPostBloc, BlogPostState>(
          builder: (context, state) {
            if (state.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.blogPost != null) {
              return ListView.builder(
                itemCount: state.blogPost!.length,
                itemBuilder: (context, index) {
                  final user = state.blogPost![index];
                  return ListTile(
                    leading: Text(user.author),
                    title: Text(
                      user.title,
                    ),
                    subtitle: Text(user.content),
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
